import 'package:biorbank/utils/helpers/helper_binance.dart';
import 'package:biorbank/utils/helpers/helper_bitcoin.dart';
import 'package:biorbank/utils/helpers/helper_ethereum.dart';
import 'package:biorbank/utils/helpers/helper_polygon.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';

enum BlockchainHelperType {
  bitcoin,
  ethereum,
  binance,
  polygon,
}

abstract class BlockchainHelper {
  final WalletAddress model;
  int get networkId;

  BlockchainHelper(this.model);
  Future<int> getCurrentBlockNumber();
  Future<Map<String, dynamic>> getTransactionStatus(String txHash);
  Future<List<Map<String, dynamic>>> getNewTransactions(
      int startBlock, int endBlock);
  factory BlockchainHelper.fromModal(
      WalletAddress model, BlockchainHelperType type) {
    switch (type) {
      case BlockchainHelperType.bitcoin:
        return BitcoinHelper(model);
      case BlockchainHelperType.ethereum:
        return EthereumHelper(model);
      case BlockchainHelperType.binance:
        return BscHelper(model);
      case BlockchainHelperType.polygon:
        return PolygonHelper(model);
    }
  }
}
