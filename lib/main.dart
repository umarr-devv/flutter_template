import 'dart:async';

import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  await initDependencies();
  runZonedGuarded(() async {
    runApp(AppScreen());
  }, (exc, st) {});
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

  GetIt.I.registerSingleton<Talker>(talker);
}
