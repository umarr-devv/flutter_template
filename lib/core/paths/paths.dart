import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AppPaths {
  late final Directory? _appDocDir;
  late final Directory? _appSupportDir;
  late final Directory? _tempDir;

  Future init() async {
    if (kIsWeb) return;

    _appDocDir = await getApplicationDocumentsDirectory();
    _appSupportDir = await getApplicationSupportDirectory();
    _tempDir = await getTemporaryDirectory();

    await _ensureDirsExist();
  }

  String get dbPath =>
      kIsWeb ? 'databases' : join(_appSupportDir!.path, 'databases');

  String get logsPath => kIsWeb ? 'logs' : join(_appSupportDir!.path, 'logs');

  String get exportsPath =>
      kIsWeb ? 'exports' : join(_appDocDir!.path, 'exports');

  String get cachePath => kIsWeb ? 'cache' : _tempDir!.path;

  Future<void> _ensureDirsExist() async {
    await Directory(dbPath).create(recursive: true);
    await Directory(logsPath).create(recursive: true);
    await Directory(exportsPath).create(recursive: true);
  }
}
