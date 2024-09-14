import 'dart:convert';

import 'package:biorbank/utils/bloc/transactiontracker/transaction_history_impl.dart';
import 'package:biorbank/utils/helpers/blockchainhelper.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class EthereumHelper extends BlockchainHelper {
  EthereumHelper(super.model);

  @override
  Future<int> getCurrentBlockNumber() async {
    /* try {
      var response = await TppApiService.instance.dio
          .get("/api.etherscan.io/api?module=proxy&action=eth_blockNumber");

      if (response.statusCode == 200) {
        var result = response.data;
        String hexString = result['result'];
        return int.parse(hexString.substring(2), radix: 16);
      }
    } catch (err) {
      LogService.logger.e('EthereumHelper getTransactionCountByAddress', err);
    }*/
    return 99999999;
  }

  @override
  Future<List<Map<String, dynamic>>> getNewTransactions(
      int startBlock, int endBlock) async {
    List<Map<String, dynamic>> newTxList = [];
    List<dynamic> txresult = [];
    //Get Coin Transfers

    /*try {
      var response = await TppApiService.instance.dio.get(
          "/api.etherscan.io/api?module=account&action=txlist&address=${model.publicKey}&startblock=${startBlock}&endblock=${endBlock}&sort=asc");
      if (response.statusCode == 200) {
        txresult.addAll(response.data['result']);
      }
      response = await TppApiService.instance.dio.get(
          "/api.etherscan.io/api?module=account&action=tokentx&address=${model.publicKey}&startblock=${startBlock}&endblock=${endBlock}&sort=asc");
      if (response.statusCode == 200) {
        txresult.addAll(response.data['result']);
      }
      int i;
      for (i = 0; i < txresult.length; i++) {
        Map<String, dynamic> tx = txresult[i];
        String amount = tx['value'];

        if (amount != '0') {
          newTxList.add({
            'type': tx['to'] == model.publicKey
                ? TransactionType.receive
                : TransactionType.send,
            'tokenId': tx['contractAddress'] ?? "",
            'txHash': tx['hash'],
            'timeStamp': DateTime.fromMillisecondsSinceEpoch(
                int.parse(tx['timeStamp']) * 1000),
            'networkFee': (BigInt.parse(tx['gasUsed']) *
                    BigInt.parse(tx['gasPrice']) /
                    BigInt.from(1e18))
                .toDouble(),
            'amount': amount,
            'from': tx['from'],
            'to': tx['to'],
          });
        }
      }
    } catch (err) {
      LogService.logger.e('EthereumHelper getNewTransactions', err);
    }
    return newTxList;*/
    return [];
  }

  @override
  Future<Map<String, dynamic>> getTransactionStatus(String txHash) async {
    /* try {
      var response = await TppApiService.instance.dio.get(
          "/api.etherscan.io/api?module=proxy&action=eth_getTransactionReceipt&txhash=${txHash}");
      if (response.statusCode == 200) {
        Map<String, dynamic> tx = jsonDecode(response.data)['result'] ?? {};
        if (tx.isEmpty) {
          return {"status": TransactionStatus.pending};
        }
        if (tx['blockNumber'] != null) {
          return {"status": TransactionStatus.completed, "networkFee": 0.0};
        }
      }
    } catch (err) {
      LogService.logger.e('EthereumHelper getTransactionStatus', err);
    }
    return {"status": TransactionStatus.pending}; */
    try {
      LogService.logger.i("Checking tx status - ${txHash}");
      final client = Web3Client(
          'https://dimensional-dark-daylight.ethereum-sepolia.quiknode.pro/d8ea75dfa368b9d3331062d83efd4276af41d573',
          Client());
      final TransactionReceipt? txReceipt =
          await client.getTransactionReceipt(txHash);
      if (txReceipt != null) {
        // Check if the transaction was successful
        if (txReceipt.status == false) {
          print('Transaction failed');
          return {"status": TransactionStatus.failed};
        }
        if (txReceipt.blockNumber == const BlockNum.pending()) {
          print('Transaction is still pending');
          return {"status": TransactionStatus.pending};
        }
        print('Transaction completed');
        return {"status": TransactionStatus.completed, "networkFee": 0.0};
      }
    } catch (err) {
      LogService.logger.e('EthereumHelper getTransactionStatus ${err}');
    }
    print('Transaction is still pending');
    return {"status": TransactionStatus.pending};
  }

  static Future<int> getTransactionCountByAddress(String address) async {
    /*try {
      var response = await TppApiService.instance.dio.get(
          "/api.etherscan.io/api?module=account&action=txlist&address=$address&sort=asc");
      if (response.statusCode == 200) {
        return response.data['result'].length ?? 0;
      }
    } catch (err) {
      LogService.logger.e('EthereumHelper getTransactionCountByAddress', err);
    }*/
    return 0;
  }

  @override
  Future<Map<String, dynamic>> getTokenInformation(String tokenAddress) async {
    try {
      LogService.logger.i("Checking tx status - ${tokenAddress}");
      final client = Web3Client(
          'https://dimensional-dark-daylight.ethereum-sepolia.quiknode.pro/d8ea75dfa368b9d3331062d83efd4276af41d573',
          Client());
      // ! We use ERC20 for all other chains
      final erc20AbiString =
          await rootBundle.loadString('assets/abi/ERC-20.json');

      ContractAbi? _erc20Abi = ContractAbi.fromJson(erc20AbiString, 'ERC20');
      final contract =
          DeployedContract(_erc20Abi, EthereumAddress.fromHex(tokenAddress));

      final tokenName = await client.call(
        contract: contract,
        function: contract.function('name'),
        params: [],
      );

      final tokenSymbol = await client.call(
        contract: contract,
        function: contract.function('symbol'),
        params: [],
      );

      final tokenDecimals = await client.call(
        contract: contract,
        function: contract.function('decimals'),
        params: [],
      );
      LogService.logger.i("${tokenName} ${tokenSymbol} ${tokenDecimals}");
      return {
        "tokenName": tokenName.first,
        "tokenSymbol": tokenSymbol.first,
        "tokenDecimals": tokenDecimals.first
      };
    } catch (err) {
      LogService.logger.e('EthereumHelper getTransactionStatus ${err}');
      throw err;
    }
    return {};
  }

  @override
  int get networkId => 1;
}
