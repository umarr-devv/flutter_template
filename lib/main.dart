import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/app/di.dart';
import 'package:app/app/errors/error_handlers.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:talker/talker.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await setupDependencies();
      await setupErrors();
      runApp(App());
    },
    (exc, st) {
      GetIt.I<Talker>().error(exc, st);
    },
  );
}
