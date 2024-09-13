import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:biorbank/utils/bloc/transactiontracker/transaction_history_impl.dart';
import 'package:biorbank/utils/constants/constants.dart';
import 'package:biorbank/utils/database_service.dart/database_service.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/helpers/blockchainhelper.dart';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/models/transaction_detail_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/service/blockchain_service.dart';
import 'package:biorbank/utils/service/cmc_service.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'package:uuid/uuid.dart';
part 'crypto_db_repository_state.dart';
part 'crypto_db_repository_init_data.dart';

class CryptoDBRepositoryImpl extends Cubit<CryptoDBRepositoryState> {
  final StreamController<CryptoDBRepositoryState> _myStreamController =
      StreamController<CryptoDBRepositoryState>();
  final _lockState = Lock();
  final _localTransactionHistory = Lock();
  Timer _timer = Timer(Duration.zero, () {});
  Timer _timerTransaction = Timer(Duration.zero, () {});
  CryptoDBRepositoryImpl._({required CryptoDBRepositoryState state})
      : super(state);
  @override
  Future<void> close() {
    _myStreamController.close();

    LogService.logger.i('Crypto DB Repository Closed');
    return super.close();
  }

  static CryptoDBRepositoryImpl create() {
    CryptoDBRepositoryState state = CryptoDBRepositoryState();
    CryptoDBRepositoryImpl db = CryptoDBRepositoryImpl._(state: state);
    // await db.initDB();
    return db;
  }

  bool _isAppActive() {
    return AppHelper.appStatus == AppStatus.active;
  }

  Future<bool> updateWallet(int index, String newName) async {
    bool isSuccess =
        (await AppHelper.walletService.updateWallet(index, newName));
    emit(state.copyWith(key: const Uuid().v4()));
    return isSuccess;
  }

  Future<void> storeWallet(BiorBankWallet newWallet) async {
    await AppHelper.walletService.storeWallet(newWallet);
    LogService.logger.i('store wallet');
    await initRepo();
  }

  Future<void> changeWallet(int index) async {
    await AppHelper.walletService.changeWallet(index);

    _timer.cancel();
    _timerTransaction.cancel();
    await initRepo();
  }

  Future<void> removeWallet(int index) async {
    int curIndex = AppHelper.walletService.currentIndex;
    await AppHelper.walletService.removeWallet(index);
    _timer.cancel();
    _timerTransaction.cancel();
    if (curIndex == index) {
      //removed current wallet
      await initRepo();
    }
  }

  Future<void> initRepo() async {
    if (!AppHelper.walletService.isWalletExist) return;

    BlockchainService.instance.init();
    await DatabaseService.instance.initDB();
    await initCryptoAsset();
    updateTransactionHistory();
    LogService.logger.i('Init repo');
  }

//! adding TransactionHistory to the state
//! divide two function for migration
  Future<void> addTransactionHistory(
      TransactionType type,
      String txHash,
      int index,
      int networkIndex,
      TransactionDetail detail,
      TransactionStatus? status,
      double? networkFee,
      DateTime timeStamp) async {
    final SplayTreeSet<TransactionHistoryImpl> newList =
        SplayTreeSet.from(state.historyList, (a, b) {
      if (a.txHash == b.txHash) {
        return 0;
      }
      return -a.timeStamp.compareTo(b.timeStamp);
    });

    final newTransaction = TransactionHistoryImpl(
        type: type,
        txHash: txHash,
        assetIndex: index,
        info: detail,
        bhelper: BlockchainService.instance.getHelperByNetworkId(networkIndex),
        status: status ?? TransactionStatus.pending,
        networkFee: networkFee ?? 0,
        timeStamp: timeStamp);
    bool isNewData = newList.add(newTransaction);
    if (isNewData == false) {
      //Already exists in the db
      return;
    }
    TransactionHistoryImpl added =
        newList.firstWhere((value) => value.txHash == txHash);
    try {
      await DatabaseService.instance.insertTransactionHistory(added);
    } catch (err) {
      return;
    }
    if (status == TransactionStatus.pending) {
      added.stream.listen((txstate) async {
        if (txstate.status == TransactionStatus.completed) {
          //update
          try {
            await state.assetList[added.assetIndex].updateBalance();
            await DatabaseService.instance.updateTransactionHistory(added);
            if (_myStreamController.isClosed) return;
          } catch (err) {}
        }
      });
    }
    emit(state.copyWith(historyList: newList));
  }

  Future<void> updateTransactionHistory() async {
    await _localTransactionHistory.synchronized(_updateTransactionHistory);
  }

  Future<void> _updateTransactionHistory() async {
    try {
      int i;

      String currentId = AppHelper.walletService.currentWallet.id;

      List<int> oldBlockNumbers =
          await DatabaseService.instance.currentBlockNumbers;

      List<int> currentBlockNumbers = await getCurrentBlockNumbers();
      // List<int> newBlockNumbers =
      //     await DatabaseService.instance.currentBlockNumbers;
      List<List<Map<String, dynamic>>> txlist = [];
      for (i = 0; i < BlockchainService.instance.bhelpers.length; i++) {
        BlockchainHelper bhelper =
            BlockchainService.instance.bhelpers.elementAt(i);
        txlist.add((await bhelper.getNewTransactions(
            oldBlockNumbers[i], currentBlockNumbers[i])));
      }

      if (currentId != AppHelper.walletService.currentWallet.id) {
        LogService.logger.w(
            'Update Transaction History was executed while wallet was changed');
        return;
        // We should not update the transaction history if the wallet was changed
      }
      for (i = 0; i < BlockchainService.instance.bhelpers.length; i++) {
        for (var element in txlist[i]) {
          int index = state.assetList.indexWhere((asset) =>
              asset.getAsset().networkId == i &&
              compareContractAddress(
                  asset.getAsset().tokenId, element['tokenId']));
          if (index != -1) {
            await addTransactionHistory(
                element['type'],
                element['txHash'],
                index,
                i,
                TransactionDetail(
                  from: element['from'],
                  to: element['to'],
                  amount: BigInt.parse(element['amount']) /
                      BigInt.from(
                          pow(10, state.assetList[index].getAsset().decimal)),
                ),
                TransactionStatus.completed,
                element['networkFee'],
                element['timeStamp']);
          }
        }
      }

      await updateBlockNumbers(currentBlockNumbers);

      emit(state.copyWith(key: const Uuid().v4()));
      LogService.logger.i('Update Transaction History ended');
    } catch (error) {
      LogService.logger.e('Update Transaction History ${error}');
    }
  }

  Future<void> _updateState() async {
    int i;
    double balance = 0;
    List<CryptoAssetInformation> assetInformationList = state.assetList
        .map<CryptoAssetInformation>((a) => a.getAsset())
        .toList();
    List<CryptoQuote> quoteList =
        await getCryptoQuotesfromCMC(assetInformationList);
    double totalBalance = 0;
    for (i = 0; i < state.assetList.length; i++) {
      await Future.wait([
        //TODO

        state.assetList
            .elementAt(i)
            .updateBalance()
            .then((value) => balance = value),
        state.assetList.elementAt(i).updateQuote(quoteList.elementAt(i))
      ]);
      totalBalance += balance * quoteList.elementAt(i).priceInUSD;
    }
    emit(state.copyWith(totalPrice: totalBalance));
  }

  Future<void> updateState() async {
    if (!_isAppActive()) return;
    await _lockState.synchronized(_updateState);
  }

  Future<List<CryptoQuote>> getCryptoQuotesfromCMC(
      List<CryptoAssetInformation> assetList) async {
    //TODO remove this in the future
    // ! HardCode Rivia
    int indexOfRivia = assetList.indexWhere(
        (element) => element.cmcId == Constants.riviaTokenFakeCmcId);
    int indexOfBslHts = assetList.indexWhere(
        (element) => element.cmcId == Constants.bslHtsTokenFakeCmcId);
    if (indexOfRivia >= 0 || indexOfBslHts >= 0) {
      List<CryptoAssetInformation> temp = List.from(assetList);

      if (indexOfRivia >= 0) {
        temp.removeWhere(
            (element) => element.cmcId == Constants.riviaTokenFakeCmcId);
      }
      if (indexOfBslHts >= 0) {
        temp.removeWhere(
            (element) => element.cmcId == Constants.bslHtsTokenFakeCmcId);
      }

      List<int> cmcIdList = temp.map((asset) => asset.cmcId).toList();
      List<CryptoQuote> quoteList =
          await getCryptoQuoteLatestMultiple(cmcIdList);
      CryptoQuote riviaQuote =
          await getCryptoQuoteLastestSingle(0, Constants.riviaTokenFakeCmcId);
      CryptoQuote bslHtsQuote =
          await getCryptoQuoteLastestSingle(0, Constants.bslHtsTokenFakeCmcId);
      if (indexOfRivia >= 0) quoteList.insert(indexOfRivia, riviaQuote);
      if (indexOfBslHts >= 0) quoteList.insert(indexOfBslHts, bslHtsQuote);

      return quoteList;
    }

    List<int> cmcIdList = assetList.map((asset) => asset.cmcId).toList();
    List<CryptoQuote> quoteList = await getCryptoQuoteLatestMultiple(cmcIdList);
    return quoteList;
  }

  /// DB operation part
  Future<void> initCryptoAsset() async {
    List<CryptoAssetRepositoryImpl> tempList = [];
    List<CryptoAssetInformation> assetList =
        await DatabaseService.instance.getAllAssets;
    List<NetworkInformation> networkList =
        await DatabaseService.instance.getAllNetworks;
    List<TransactionHistoryImpl> historyList =
        await DatabaseService.instance.getAllTransactionHistory;
    int i, count = assetList.length;

    for (i = 0; i < count; i++) {
      CryptoAssetInformation asset = assetList.elementAt(i);
      NetworkInformation network =
          networkList.where((element) => element.id == asset.networkId).first;
      CryptoAssetRepositoryImpl repo =
          await CryptoAssetRepositoryImpl.create(asset, network);
      tempList.add(repo);
    }

    if (_myStreamController.isClosed) return;
    emit(state.copyWith(
        assetList: tempList,
        historyList: SplayTreeSet<TransactionHistoryImpl>.from(
            [], (a, b) => -a.state.timeStamp.compareTo(b.state.timeStamp))
          ..addAll(historyList)));
    if (_timer.isActive) _timer.cancel();
    if (_timerTransaction.isActive) _timerTransaction.cancel();
    _timer = Timer.periodic(const Duration(seconds: 300), (timer) async {
      updateState();
    });
    _timerTransaction =
        Timer.periodic(const Duration(seconds: 300), (timer) async {
      updateTransactionHistory();
    });
    updateState();
  }

  Future<int> importToken(
      CryptoAssetInformation assetInfo, NetworkInformation networkInfo) async {
    CryptoAssetRepositoryImpl repo =
        await CryptoAssetRepositoryImpl.create(assetInfo, networkInfo);

    //Saving to DB
    await DatabaseService.instance.importCryptoAsset(assetInfo);
    emit(state.copyWith(assetList: List.from(state.assetList)..add(repo)));
    getCryptoQuoteLastestSingle(0, assetInfo.cmcId).then(
      (value) {
        repo.updateQuote(value);
        emit(state.copyWith(
            totalPrice:
                state.totalPrice + repo.state.balance * value.priceInUSD));
      },
    );
    return state.assetList.length - 1;
  }

  void toggleAssetVisibilityByIndex(int index) {
    // In sqllite, index starts from 1
    DatabaseService.instance.toggleAssetVisibilityByIndex(
        state.assetList.elementAt(index).getAsset().hidden == 0 ? 1 : 0, index);
    if (_myStreamController.isClosed) return;
    emit(state.copyWith(
        key: const Uuid().v4(),
        assetList: List.from(state.assetList)
          ..elementAt(index).getAsset().toogleVisibility()));
  }

  int getAssetCountState() {
    return state.assetList.length;
  }

  CryptoAssetRepositoryImpl getFullAssetByID(int index) {
    return state.assetList.elementAt(index);
  }

  Future<void> updateBlockNumbers(List<int> currentBlockHeight) async {
    List<Future<void>> updateFutures = [];
    for (int i = 0; i < BlockchainService.instance.bhelpers.length; i++) {
      updateFutures.add(DatabaseService.instance
          .updateBlockHeightByIndex(currentBlockHeight[i], i));
    }
    await Future.wait(updateFutures);
  }

  Future<List<int>> getCurrentBlockNumbers() async {
    List<Future<int>> heightFutures = [];
    for (int i = 0; i < BlockchainService.instance.bhelpers.length; i++) {
      BlockchainHelper bhelper = BlockchainService.instance.bhelpers[i];
      heightFutures.add(bhelper.getCurrentBlockNumber());
    }

    List<int> currentBlockHeight = await Future.wait(heightFutures);
    return currentBlockHeight;
  }
}
