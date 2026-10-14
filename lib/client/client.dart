import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi()
abstract class Client {
  factory Client(Dio dio, {String? baseUrl}) = _Client;

  @GET('/')
  Future getData();
}
