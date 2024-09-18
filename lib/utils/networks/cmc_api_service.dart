import 'package:biorbank/utils/env/env.dart';
import 'package:dio/dio.dart';

class CmcApiService {
  static CmcApiService? _instance;

  static CmcApiService get instance {
    if (_instance != null) return _instance!;
    _instance = CmcApiService._init();
    return _instance!;
  }

  final String _baseUrl = 'https://pro-api.coinmarketcap.com';
  late final Dio dio;

  CmcApiService._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          'X-CMC_PRO_API_KEY': Env.coinmarketcapAPIKEY,
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
