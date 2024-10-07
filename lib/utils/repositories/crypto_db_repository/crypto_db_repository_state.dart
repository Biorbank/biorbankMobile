part of 'crypto_db_repository_impl.dart';

class CryptoDBRepositoryState extends Equatable {
  CryptoDBRepositoryState(
      {List<CryptoAssetRepositoryImpl>? assetList,
      SplayTreeSet<TransactionHistoryImpl>? historyList,
      List<TotalAmountHistory>? totalAmountHistoryList,
      String? key,
      this.totalPrice = 0})
      : assetList = assetList ?? [],
        key = key ?? const Uuid().v4(),
        historyList = historyList ??
            SplayTreeSet<TransactionHistoryImpl>(
                (a, b) => a.state.timeStamp.compareTo(b.state.timeStamp)),
        totalAmountHistoryList = totalAmountHistoryList ?? [];

  CryptoDBRepositoryState copyWith({
    final List<CryptoAssetRepositoryImpl>? assetList,
    final SplayTreeSet<TransactionHistoryImpl>? historyList,
    final List<TotalAmountHistory>? totalAmountHistoryList,
    final double? totalPrice,
    final String? key,
  }) =>
      CryptoDBRepositoryState(
        assetList: assetList ?? this.assetList,
        totalPrice: totalPrice ?? this.totalPrice,
        historyList: historyList ?? this.historyList,
        totalAmountHistoryList:
            totalAmountHistoryList ?? this.totalAmountHistoryList,
        key: key ?? this.key,
      );

  List<CryptoAssetRepositoryImpl> assetList;
  SplayTreeSet<TransactionHistoryImpl> historyList;
  List<TotalAmountHistory> totalAmountHistoryList;
  final double totalPrice;
  final String key;
  @override
  List<Object?> get props =>
      [assetList, totalPrice, historyList, totalAmountHistoryList, key];
}
