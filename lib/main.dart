import 'dart:async';

import 'package:app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    runApp(AppScreen());
  }, (exc, st) {});
}
