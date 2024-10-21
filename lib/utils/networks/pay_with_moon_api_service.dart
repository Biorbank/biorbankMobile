import 'package:dio/dio.dart';

import '../env/env.dart';

class PayWithMoonApiService {
  static PayWithMoonApiService? _instance;

  static PayWithMoonApiService get instance {
    if (_instance != null) return _instance!;
    _instance = PayWithMoonApiService._init();
    return _instance!;
  }

  final String _baseUrl = 'https://virtserver.swaggerhub.com/Moon6/Moon-card-issuing/1.0.4';
  late final Dio dio;

  PayWithMoonApiService._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          'x-api-key': Env.banksocialApiKey,
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
