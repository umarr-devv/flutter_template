import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Paths {
  late final Directory? appDocDir;
  late final Directory? appSupportDir;
  late final Directory? tempDir;

  Future<Paths> init() async {
    if (!kIsWeb) {
      appDocDir = await getApplicationDocumentsDirectory();
      appSupportDir = await getApplicationSupportDirectory();
      tempDir = await getTemporaryDirectory();
      await _ensureDirsExist();
    }

    return this;
  }

  String get database =>
      kIsWeb ? 'database' : join(appSupportDir!.path, 'databases');

  String get cookies =>
      kIsWeb ? 'cookies' : join(appSupportDir!.path, 'cookies');

  String get cache => kIsWeb ? 'cache' : tempDir!.path;

  Future _ensureDirsExist() async {
    await Directory(database).create(recursive: true);
    await Directory(cache).create(recursive: true);
  }
}
