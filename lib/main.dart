import 'dart:async';

import 'package:app/app.dart';
import 'package:app/core/api/api.dart';
import 'package:app/core/paths/paths.dart';
import 'package:app/core/setups/setups.dart';
import 'package:app/data/storages/storages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  final talker = TalkerSetup.init();
  GetIt.I.registerSingleton(talker);

  runZonedGuarded(
    () async {
      await initDependencies();
      runApp(AppScreen());
    },
    (exc, st) {
      talker.error(exc, st);
    },
  );
}

Future initDependencies() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env");

  final paths = AppPaths();
  await paths.init();

  final storage = Storage();
  final secureStorage = SecureStorage();

  final dio = DioSetup.init();
  await HydratedStorageSetup.init(paths);

  final client = RestClient(dio);

  GetIt.I.registerSingleton(storage);
  GetIt.I.registerSingleton(secureStorage);
  GetIt.I.registerSingleton(client);
}
