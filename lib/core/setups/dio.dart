import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DioSetup {
  static String url = dotenv.env['API']!;

  static Dio init() {
    final dio = Dio(BaseOptions(baseUrl: url));
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(printResponseData: false),
        talker: GetIt.I<Talker>(),
      ),
    );
    return dio;
  }
}
