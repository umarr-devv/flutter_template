import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class GeneralStorage {
  late final Box box;

  Future init() async {
    Directory? dir;
    if (!kIsWeb && (Platform.isWindows || Platform.isMacOS)) {
      dir = await getApplicationDocumentsDirectory();
    }
    Hive.initFlutter(dir?.path);
    box = await Hive.openBox('general_storage');
  }

  Future<void> write(String key, value) async {
    await box.put(key, value.toJson());
  }

  Map<String, dynamic>? read(String key) {
    return box.get(key) as Map<String, dynamic>?;
  }
}
