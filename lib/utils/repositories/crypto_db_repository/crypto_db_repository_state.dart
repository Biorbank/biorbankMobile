part of 'crypto_db_repository_impl.dart';

class CryptoDBRepositoryState extends Equatable {
  CryptoDBRepositoryState(
      {List<CryptoAssetRepositoryImpl>? assetList,
      SplayTreeSet<TransactionHistoryImpl>? historyList,
      String? key,
      this.totalPrice = 0})
      : assetList = assetList ?? [],
        key = key ?? const Uuid().v4(),
        historyList = historyList ??
            SplayTreeSet<TransactionHistoryImpl>(
                (a, b) => a.state.timeStamp.compareTo(b.state.timeStamp));

  CryptoDBRepositoryState copyWith({
    final List<CryptoAssetRepositoryImpl>? assetList,
    final SplayTreeSet<TransactionHistoryImpl>? historyList,
    final double? totalPrice,
    final String? key,
  }) =>
      CryptoDBRepositoryState(
        assetList: assetList ?? this.assetList,
        totalPrice: totalPrice ?? this.totalPrice,
        historyList: historyList ?? this.historyList,
        key: key ?? this.key,
      );

  List<CryptoAssetRepositoryImpl> assetList;
  SplayTreeSet<TransactionHistoryImpl> historyList;
  final double totalPrice;
  final String key;
  @override
  List<Object?> get props => [assetList, totalPrice, historyList, key];
}
