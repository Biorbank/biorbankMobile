import 'dart:convert';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/models/response_model.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:http/http.dart' as http;

Future<CryptoQuote> getCryptoQuoteLastestSingle(int id, int cmcId) async {
  /*try {
    if (cmcId == Constants.riviaTokenFakeCmcId ||
        cmcId == Constants.bslHtsTokenFakeCmcId) {
      return CryptoQuote(
        id: id,
        cmcId: cmcId,
        priceInUSD: 1,
        volumeday: 0,
        volumeChangeday: 0,
        percentChangeday: 0,
        percentChangehour: 0,
        percentChangeweek: 0,
        percentChangemonth: 0,
        marketCap: 0,
        dilutedMarketCap: 0,
      );
    }
    var response = await TppApiService.instance.dio.get(
        "/pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest?id=$cmcId");
    CryptoQuote cq = CryptoQuote();
    if (response.statusCode == 200) {
      var result = response.data;
      var data = result['data']['$cmcId']['quote']['USD'];
      cq = CryptoQuote(
        id: id,
        cmcId: cmcId,
        priceInUSD: safeConvertToDouble(data['price']),
        volumeday: safeConvertToDouble(data['volume_24h']),
        volumeChangeday: safeConvertToDouble(data['volume_change_24h']),
        percentChangeday: safeConvertToDouble(data['percent_change_24h']),
        percentChangehour: safeConvertToDouble(data['percent_change_1h']),
        percentChangeweek: safeConvertToDouble(data['percent_change_7d']),
        percentChangemonth: safeConvertToDouble(data['percent_change_30d']),
        marketCap: safeConvertToDouble(data['market_cap']),
        dilutedMarketCap: safeConvertToDouble(data['fully_diluted_market_cap']),
      );
    }
    return cq;
  } catch (error) {
    LogService.logger.e('getCryptoQuoteLatestSingle ${error}');
  }*/
  return const CryptoQuote();
}

Future<List<CryptoQuote>> getCryptoQuoteLatestMultiple(
    List<int> cmcIdlist) async {
  List<CryptoQuote> list = [];
  /*String multiple = cmcIdlist.join(',');
  var response = await TppApiService.instance.dio.get(
      "/pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest?id=$multiple");

  if (response.statusCode == 200) {
    var result = response.data;
    for (int id = 0; id < cmcIdlist.length; id++) {
      int index = cmcIdlist.elementAt(id);
      var data = result['data']['$index']['quote']['USD'];
      CryptoQuote cq = CryptoQuote(
        id: id,
        cmcId: index,
        priceInUSD: safeConvertToDouble(data['price']),
        volumeday: safeConvertToDouble(data['volume_24h']),
        volumeChangeday: safeConvertToDouble(data['volume_change_24h']),
        percentChangeday: safeConvertToDouble(data['percent_change_24h']),
        percentChangehour: safeConvertToDouble(data['percent_change_1h']),
        percentChangeweek: safeConvertToDouble(data['percent_change_7d']),
        percentChangemonth: safeConvertToDouble(data['percent_change_30d']),
        marketCap: safeConvertToDouble(data['market_cap']),
        dilutedMarketCap: safeConvertToDouble(data['fully_diluted_market_cap']),
      );
      list.add(cq);
    }
    return list;
  }*/
  return list;
}

enum QuoteIntervalType {
  hour,
  day,
  week,
  month,
  year,
}

Map<String, dynamic> getIntervalAndCount(QuoteIntervalType type) {
  String interval = "";
  int count = 0;
  switch (type) {
    case QuoteIntervalType.hour:
      interval = "5m";
      count = 12;
      break;
    case QuoteIntervalType.day:
      interval = "30m";
      count = 48;
      break;
    case QuoteIntervalType.week:
      interval = "2h";
      count = 42;
      break;
    case QuoteIntervalType.month:
      interval = "6h";
      count = 62;
      break;
    case QuoteIntervalType.year:
      interval = "7d";
      count = 52;
      break;
  }
  return {
    'interval': interval,
    'count': count,
  };
}

Future<FunctionResponse> getCryptoQuoteHistoricalSingle(
    int cmcId, QuoteIntervalType type) async {
  /*try {
    Map data = getIntervalAndCount(type);

    var response = await TppApiService.instance.dio.get(
        "/pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/historical?id=${cmcId}&interval=${data['interval']}&aux=price&count=${data['count']}");
    if (response.statusCode == 200) {
      var result = response.data;
      List<dynamic> data = result['data']['quotes'];
      List<DateTime> timeList =
          data.map<DateTime>((a) => DateTime.parse(a['timestamp'])).toList();
      List<double> quoteList =
          data.map<double>((a) => a['quote']['USD']['price']).toList();
      return FunctionResponse(statusCode: 1, message: [timeList, quoteList]);
    }
  } catch (error) {
    LogService.logger.e('getCryptoQuoteHistoricalSingle', error);
  }*/
  return FunctionResponse(statusCode: 0, message: []);
}
