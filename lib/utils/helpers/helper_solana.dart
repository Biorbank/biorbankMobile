import 'package:biorbank/utils/bloc/transactiontracker/transaction_history_impl.dart';
import 'package:biorbank/utils/env/env.dart';
import 'package:biorbank/utils/helpers/blockchainhelper.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:solana/solana.dart'; // Use the solana_web3 package
import 'dart:convert';
import 'package:http/http.dart' as http;

class SolanaHelper extends BlockchainHelper {
  final RpcClient client;
  final String rpcUrl = Env.solanaRpcUrl;

  SolanaHelper(super.model)
      : client = RpcClient(Env.solanaRpcUrl); // Use Solana Devnet by default
  @override
  Future<int> getCurrentBlockNumber() async {
    try {
      final response = await http.post(
        Uri.parse(rpcUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "jsonrpc": "2.0",
          "id": 1,
          "method": "getSlot",
        }),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json['result'];
      }
    } catch (err) {
      LogService.logger.e(err);
    }
    return -1; // Return an error value if failed
  }

  @override
  Future<List<Map<String, dynamic>>> getNewTransactions(
      int startBlock, int endBlock) async {
    List<Map<String, dynamic>> newTxList = [];

    try {
      // Use getSignaturesForAddress to get recent transactions
      final response = await http.post(
        Uri.parse(rpcUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "jsonrpc": "2.0",
          "id": 1,
          "method": "getSignaturesForAddress",
          "params": [
            model.publicKey, // Your wallet public key
            {"limit": 10, "before": null}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final signatures = result['result'] as List<dynamic>;

        for (var signatureData in signatures) {
          final signature = signatureData['signature'];

          // Get transaction details for each signature
          final transactionResponse = await http.post(
            Uri.parse(rpcUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              "jsonrpc": "2.0",
              "id": 1,
              "method": "getConfirmedTransaction",
              "params": [signature]
            }),
          );

          if (transactionResponse.statusCode == 200) {
            final transactionResult =
                jsonDecode(transactionResponse.body)['result'];
            if (transactionResult != null) {
              final tx = transactionResult['transaction'];

              // Extract relevant data and add to newTxList
              newTxList.add({
                'txHash': signature,
                'timeStamp': DateTime.fromMillisecondsSinceEpoch(
                    transactionResult['blockTime'] * 1000),
                'networkFee': transactionResult['meta']['fee'] /
                    1e9, // Convert lamports to SOL
                'amount': tx['message']['instructions'][0]
                    ['data'], // Instruction data
                'from': tx['message']['accountKeys'][0],
                'to': tx['message']['accountKeys'][1],
              });
            }
          }
        }
      }
    } catch (err) {
      LogService.logger.e(err);
    }

    return newTxList;
  }

  @override
  Future<Map<String, dynamic>> getTransactionStatus(String txHash) async {
    try {
      LogService.logger.i("Checking transaction status - $txHash");
      final response = await http.post(
        Uri.parse(rpcUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "jsonrpc": "2.0",
          "id": 1,
          "method": "getConfirmedTransaction",
          "params": [txHash]
        }),
      );

      if (response.statusCode == 200) {
        final transactionResult = jsonDecode(response.body)['result'];
        if (transactionResult != null) {
          final meta = transactionResult['meta'];

          // Check transaction status and return appropriate result
          if (meta['err'] != null) {
            return {"status": TransactionStatus.failed};
          }

          return {
            "status": TransactionStatus.completed,
            "networkFee": meta['fee'] / 1e9
          };
        }
      }
    } catch (err) {
      LogService.logger.e(err);
    }

    return {"status": TransactionStatus.pending};
  }

  @override
  Future<Map<String, dynamic>> getTokenInformation(String tokenAddress) async {
    try {
      LogService.logger.i("Checking token information - $tokenAddress");
      final response = await http.post(
        Uri.parse(rpcUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "jsonrpc": "2.0",
          "id": 1,
          "method": "getTokenAccountsByOwner",
          "params": [
            tokenAddress,
            {
              "programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"
            } // Token Program ID
          ]
        }),
      );

      if (response.statusCode == 200) {
        final tokenInfo = jsonDecode(response.body)['result'];

        // Process and return token information
        if (tokenInfo != null) {
          return {
            "tokenName": tokenInfo['name'] ?? "Unknown",
            "tokenSymbol": tokenInfo['symbol'] ?? "Unknown",
            "tokenDecimals": tokenInfo['decimals'] ?? 0,
          };
        }
      }
    } catch (err) {
      LogService.logger.e(err);
    }

    // Return an empty map or a default value if something goes wrong
    return {
      "tokenName": "Unknown",
      "tokenSymbol": "Unknown",
      "tokenDecimals": 0,
    };
  }

  @override
  int get networkId => 6; // Solana Devnet
}
