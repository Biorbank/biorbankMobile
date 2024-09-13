part of 'crypto_asset_repostiory_impl.dart';

enum CryptoAssetState {
  loading,
  loaded,
}

class CryptoAssetRepositoryState extends Equatable {
  const CryptoAssetRepositoryState({
    this.quote = const CryptoQuote(),
    this.balance = 0,
    this.gasPrice = "",
    this.assetState = CryptoAssetState.loading,
    this.quoteState = CryptoAssetState.loading,
  });

  CryptoAssetRepositoryState copyWith({
    final CryptoQuote? quote,
    final double? balance,
    final String? gasPrice,
    final CryptoAssetState? assetState,
    final CryptoAssetState? quoteState,
  }) =>
      CryptoAssetRepositoryState(
          quote: quote ?? this.quote,
          balance: balance ?? this.balance,
          gasPrice: gasPrice ?? this.gasPrice,
          assetState: assetState ?? this.assetState,
          quoteState: quoteState ?? this.quoteState);
  final CryptoQuote quote;
  final double balance;
  final String gasPrice;
  final CryptoAssetState assetState;
  final CryptoAssetState quoteState;
  @override
  List<Object?> get props => [quote, balance, gasPrice, assetState, quoteState];

  // CryptoAssetRepositoryState.init() : CryptoAssetRepositoryState(assetState: CryptoAssetState.loading,quote : CryptoQuote(),balance : 0);
  // const AuthState.firstEntry() : this._(status: AuthStatus.guest);
}
