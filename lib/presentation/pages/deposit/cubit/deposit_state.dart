part of 'deposit_cubit.dart';

@immutable
sealed class DepositState {}

final class DepositInitial extends DepositState {}

final class DepositTabIndexState extends DepositState {
  final int index;
  DepositTabIndexState({required this.index});
}

final class ChangeNetworkListState extends DepositState {
  final List<NetworkInformation> networkList;
  ChangeNetworkListState({required this.networkList});
}

final class ChangeAssetListState extends DepositState {
  final List<CryptoAssetRepositoryImpl> assetList;
  ChangeAssetListState({required this.assetList});
}

final class NetworkSelectedState extends DepositState {
  final NetworkInformation? network;
  NetworkSelectedState({required this.network});
}

final class CoinSelectedState extends DepositState {
  final CryptoAssetRepositoryImpl? coin;
  CoinSelectedState({required this.coin});
}

final class QrCodeValueState extends DepositState {
  final String? qrValue;
  QrCodeValueState({required this.qrValue});
}
