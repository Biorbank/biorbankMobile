import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit() : super(DepositInitial());

  int depositTabIndex = 0;
  NetworkInformation? selectedNetwork;
  CryptoAssetRepositoryImpl? selectedCoin;
  String? selectedQr;

  void onChangeTabIndex({required int index}) {
    depositTabIndex = index;
    emit(DepositTabIndexState(index: index));
  }

  List<NetworkInformation> networkList = [];
  List<CryptoAssetRepositoryImpl> assetList = [], fetchedAssetList = [];
  List<String> qrCodeList = [];

  void onChangeNetworkList({required List<NetworkInformation> value}) {
    networkList = value;
    if (networkList.isNotEmpty) {
      onChangeNetwork(value: networkList.first);
    }
    emit(ChangeNetworkListState(networkList: value));
  }

  void onChangeAssetList({required List<CryptoAssetRepositoryImpl> value}) {
    assetList = value;
    emit(ChangeAssetListState(assetList: value));
  }

  void onChangeNetwork({required NetworkInformation value}) {
    selectedNetwork = value;
    selectedCoin = null;
    if (selectedNetwork == null) {
      return;
    }
    print(selectedNetwork!.id);
    fetchedAssetList = assetList.where((e) {
      if (e.getAsset().networkId != selectedNetwork!.id) {
        return false;
      }
      return true;
    }).toList();
    if (fetchedAssetList.isNotEmpty) {
      onChangeCoin(value: fetchedAssetList.first);
    }
    emit(NetworkSelectedState(network: value));
  }

  void onChangeCoin({required CryptoAssetRepositoryImpl value}) {
    selectedCoin = value;
    qrCodeList.clear();
    if (selectedCoin != null) {
      String tokenAddress = selectedCoin!.getPublicKey();
      qrCodeList.add(tokenAddress);
      onChangeQRcodeValue(value: tokenAddress);
    }
    emit(CoinSelectedState(coin: value));
  }

  void onChangeQRcodeValue({required String value}) {
    selectedQr = value;
    emit(QrCodeValueState(qrValue: value));
  }
}
