import 'dart:convert';

import 'package:biorbank/utils/bloc/transactiontracker/transaction_history_impl.dart';
import 'package:biorbank/utils/constants/constants.dart';
import 'package:biorbank/utils/helpers/blockchainhelper.dart';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/service/logger_service.dart';

import 'package:http/http.dart' as http;

class BitcoinHelper extends BlockchainHelper {
  BitcoinHelper(super.model);

  @override
  Future<int> getCurrentBlockNumber() async {
    try {
      var response = await http.get(
          Uri.parse("https://bitcoinexplorer.org/api/blocks/tip"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        //convert satoshi to btcf
        return result['height'];
      }
    } catch (e) {
      LogService.logger.e('getCurrentBlockNumber ${e}');
    }
    return 99999999;
  }

  @override
  Future<List<Map<String, dynamic>>> getNewTransactions(
      int startBlock, int endBlock) async {
    try {
      //TODO unconfirmed transaction tracking is not working
      List<Map<String, dynamic>> newTxList = [];
      var response = await http.get(
        Uri.parse("https://blockchain.info/rawaddr/${model.publicKey}"),
        headers: {
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> allTxs = (json.decode(response.body))['txs'];
        List<dynamic> txlist = allTxs
            .where((tx) =>
                tx['block_height'] != null &&
                tx['block_height'] >= startBlock + 6 &&
                tx['block_height'] <= endBlock + 6)
            .toList();
        for (int i = 0; i < txlist.length; i++) {
          Map<String, dynamic> tx = txlist[i];
          int j;
          for (j = 0; j < tx['vin_sz']; j++) {
            if (tx['inputs'][j]['prev_out']['addr'] == model.publicKey) {
              break;
            }
          }
          //Checks if receiving transaction
          if (j == tx['vin_sz']) {
            for (j = 0; j < tx['vout_sz']; j++) {
              if (tx['out'][j]['addr'] == model.publicKey) {
                break;
              }
            }

            if (j < tx['vout_sz']) {
              //found receiving transaction
              newTxList.add({
                'type': TransactionType.receive,
                'tokenId': "",
                'txHash': tx['hash'],
                'timeStamp':
                    DateTime.fromMillisecondsSinceEpoch(tx['time'] * 1000),
                'networkFee':
                    (BigInt.from(tx['fee']) / BigInt.from(1e8)).toDouble(),
                'amount': (tx['result']).toString(),
                'from': tx['inputs'][0]['prev_out']['addr'] ?? "",
                'to': model.publicKey
              });
            }
          } else {
            //send Transaction

            for (j = 0; j < tx['vin_sz']; j++) {
              if (tx['inputs'][j]['prev_out']['addr'] == model.publicKey) {
                break;
              }
            }

            if (j < tx['vin_sz']) {
              //found sending transaction
              newTxList.add({
                'type': TransactionType.send,
                'tokenId': "",
                'txHash': tx['hash'],
                'timeStamp':
                    DateTime.fromMillisecondsSinceEpoch(tx['time'] * 1000),
                'networkFee':
                    (BigInt.from(tx['fee'] ?? 0) / BigInt.from(1e8)).toDouble(),
                'amount': (tx['out'][0]['value']).toString(),
                'from': model.publicKey,
                'to': tx['out'][0]['addr'] ?? "",
              });
            }
          }
        }
      }
      return newTxList;
    } catch (e, stackTrace) {
      LogService.logger
          .e("BitcoinHelper getNewTransactions ${e} ${stackTrace}");
    }
    return [];
  }

  @override
  Future<Map<String, dynamic>> getTransactionStatus(String txHash) async {
    try {
      var response = await Constants.commonApiCall(
          'https://blockchain.info/rawtx/$txHash');
      if (response.statusCode == 200) {
        var result = response.data;
        int currentBlockNumber = await getCurrentBlockNumber();
        //Check 6 confirmations
        if (result['block_height'] != null &&
            result['block_height'] + 6 < currentBlockNumber) {
          return {
            "status": TransactionStatus.completed,
            "networkFee": safeConvertToDouble(result['fee']) / (1e8),
            "timeStamp":
                DateTime.fromMillisecondsSinceEpoch(result['time'] * 1000),
          };
        }
      }
    } catch (error) {
      LogService.logger.e('BitcoinHelper getTransactionStatus ${error}');
    }
    return {};
  }

  static Future<int> getTransactionCountByAddress(String address) async {
    try {
      var response = await Constants.commonApiCall(
          'https://blockchain.info/balance?active=$address');
      if (response.statusCode == 200) {
        var result = response.data;
        //convert satoshi to btcf
        return result[address]['n_tx'];
      }
      return 0;
    } catch (error) {
      LogService.logger
          .e('BitcoinHelper getTransactionCountByAddress ${error}');
    }
    return 0;
  }

  @override
  Future<Map<String, dynamic>> getTokenInformation(String txHash) async {
    return {};
  }

  @override
  int get networkId => 0;
}
