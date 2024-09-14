import 'package:biorbank/utils/helpers/blockchainhelper.dart';

class PolygonHelper extends BlockchainHelper {
  PolygonHelper(super.model);

  @override
  Future<int> getCurrentBlockNumber() async {
    /*try {
      var response = await TppApiService.instance.dio
          .get("/api.polygonscan.com/api?module=proxy&action=eth_blockNumber");
      if (response.statusCode == 200) {
        var result = response.data;
        String hexString = result['result'];
        return int.parse(hexString.substring(2), radix: 16);
      }
    } catch (err) {
      LogService.logger.e('PolygonHelper getCurrentBlockNumber', err);
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
          "/api.polygonscan.com/api?module=account&action=txlist&address=${model.publicKey}&startblock=${startBlock}&endblock=${endBlock}&sort=asc");
      if (response.statusCode == 200) {
        txresult.addAll(response.data['result']);
      }
      response = await TppApiService.instance.dio.get(
          "/api.polygonscan.com/api?module=account&action=tokentx&address=${model.publicKey}&startblock=${startBlock}&endblock=${endBlock}&sort=asc");
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
      LogService.logger.e('PolygonHelper getNewTransactions', err);
    }
    return newTxList;*/
    return [];
  }

  @override
  Future<Map<String, dynamic>> getTransactionStatus(String txHash) async {
    /*try {
      var response = await TppApiService.instance.dio.get(
          "/api.polygonscan.com/api?module=proxy&action=eth_getTransactionReceipt&txhash=${txHash}");
      if (response.statusCode == 200) {
        Map<String, dynamic> tx = response.data['result'] ?? {};
        if (tx.isEmpty) {
          return {"status": TransactionStatus.pending};
        }
        if (tx['blockNumber'] != null) {
          return {"status": TransactionStatus.completed, "networkFee": 0.0};
        }
      }
    } catch (err) {
      LogService.logger.e('PolygonHelper getTransactionStatus', err);
    }
    return {"status": TransactionStatus.pending};*/
    return {};
  }

  static Future<int> getTransactionCountByAddress(String address) async {
    /*try {
      var response = await TppApiService.instance.dio.get(
          "/api.polygonscan.com/api?module=account&action=txlist&address=$address&sort=asc");
      if (response.statusCode == 200) {
        return response.data['result'].length ?? 0;
      }
    } catch (error) {
      LogService.logger.e('PolygonHelper getTransactionCountByAddress', error);
    }*/
    return 0;
  }

  @override
  Future<Map<String, dynamic>> getTokenInformation(String txHash) async {
    return {};
  }

  @override
  int get networkId => 3;
}
