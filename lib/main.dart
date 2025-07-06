import 'dart:async';

import 'package:app/app.dart';
import 'package:app/data/repositories/repositories.dart';
import 'package:app/service/api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  await initDependencies();
  runZonedGuarded(
    () async {
      runApp(AppScreen());
    },
    (exc, st) {
      Talker().error('An error occurred in the app');
    },
  );
}

Future initDependencies() async {
  final talker = Talker(
    settings: TalkerSettings(
      enabled: true,
      useHistory: true,
      useConsoleLogs: true,
    ),
    logger: TalkerLogger(),
  );

  final dio = Dio();
  final apiClient = ApiClient(dio: dio);
  final secureStorage = SecureStorage();
  final generalStorage = GeneralStorage();

  apiClient.init();
  secureStorage.init();
  await generalStorage.init();

  GetIt.I.registerSingleton<Talker>(talker);
  GetIt.I.registerSingleton<ApiClient>(apiClient);
  GetIt.I.registerSingleton<SecureStorage>(secureStorage);
  GetIt.I.registerSingleton<GeneralStorage>(generalStorage);
}
