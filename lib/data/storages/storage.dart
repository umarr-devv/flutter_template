import 'package:app/core/paths/paths.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@lazySingleton
class Storage {
  late final Box _box;

  Future init(AppPaths paths) async {
    final dbPath = join(paths.dbPath, 'hive_db');
    await Hive.initFlutter(dbPath);
    _box = await Hive.openBox('box');
  }

  Future write(String key, dynamic value) async {
    await _box.put(key, value);
  }

  bool has(String key) => _box.containsKey(key);

  Future<dynamic> read(String key) async {
    return await _box.get(key);
  }

  Future delete(String key) async {
    await _box.delete(key);
  }

  Future clear() async {
    await _box.clear();
  }
}
