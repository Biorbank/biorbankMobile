import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/helpers/blockchainhelper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';

class BlockchainService {
  static BlockchainService? _instance;
  List<BlockchainHelper> _bhelpers = [];
  static BlockchainService get instance {
    _instance ??= BlockchainService();
    return _instance!;
  }

  void init() {
    _bhelpers = [];
    BiorBankWallet currentWallet = AppHelper.walletService.currentWallet;

    if (!currentWallet.isLegacyWallet) {
      WalletAddress btcmodel = currentWallet.btcwallet!;
      WalletAddress solanamodel = currentWallet.solanawallet!;
      _bhelpers.add(
          BlockchainHelper.fromModal(btcmodel, BlockchainHelperType.bitcoin));
      _bhelpers.add(
          BlockchainHelper.fromModal(solanamodel, BlockchainHelperType.solana));
    }
    WalletAddress ethmodel = currentWallet.ethwallet;

    _bhelpers.add(
        BlockchainHelper.fromModal(ethmodel, BlockchainHelperType.ethereum));
    _bhelpers.add(
        BlockchainHelper.fromModal(ethmodel, BlockchainHelperType.binance));
    _bhelpers.add(
        BlockchainHelper.fromModal(ethmodel, BlockchainHelperType.polygon));

  }

  List<BlockchainHelper> get bhelpers {
    return _bhelpers;
  }

  BlockchainHelper getHelperByNetworkId(int networkId) {
    return _bhelpers.firstWhere((element) => element.networkId == networkId);
  }
}
