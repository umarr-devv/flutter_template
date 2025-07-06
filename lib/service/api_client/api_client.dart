import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class ApiClient {
  ApiClient({required this.dio});

  final Dio dio;
  final String url = dotenv.env['API']!;

  void init() {
    dio.options.baseUrl = url;
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(printResponseData: false),
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {}),
    );
  }
}
