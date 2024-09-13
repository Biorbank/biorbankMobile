import 'dart:async';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/models/response_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repository_btc_impl.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repository_evm_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'crypto_asset_repository_state.dart';

abstract class CryptoAssetRepositoryImpl
    extends Cubit<CryptoAssetRepositoryState> {
  CryptoAssetRepositoryImpl({
    required CryptoAssetRepositoryState state,
  }) : super(state);

  Future<double> updateBalance();
  Future<String> updateGasPrice();

  Future<CryptoQuote> updateQuote(CryptoQuote newQuote) async {
    //TODO change this in the future
    try {
      emit(
          state.copyWith(quote: newQuote, quoteState: CryptoAssetState.loaded));
      return newQuote;
    } catch (e) {
      return const CryptoQuote();
    }
  }

  Future<FunctionResponse> sendBalanceEstimateGas(
      double amount, String toAddress);

  Future<double> getBalance();
  Future<String> sendBalance(double amount, String toAddress);

  /// Get balance for external address of asset
  Future<double> getBalanceForExternalAddress(String address);
  CryptoAssetInformation getAsset();
  NetworkInformation getNetwork();

  String getPublicKey();
  bool validateAddress(String value);

  Future<void> initialize();

  static Future<CryptoAssetRepositoryImpl> create(
    CryptoAssetInformation asset,
    NetworkInformation network,
  ) async {
    late final CryptoAssetRepositoryImpl repo;
    final currentWallet = AppHelper.walletService.currentWallet;
    int networkId = asset.networkId;
    if (networkId == 0) {
      repo = CryptoAssetRepositoryBtcImpl(
          walletAddress: currentWallet.btcwallet!,
          asset: asset,
          network: network);
    } else {
      repo = CryptoAssetRepositoryEvmImpl(
        asset: asset,
        network: network,
        walletAddress: currentWallet.ethwallet,
      );
    }
    repo.initialize();
    return repo;
  }
}
