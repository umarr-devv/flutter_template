import 'package:app/app/paths.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path/path.dart';

class GeneralStorage {
  late final Box _box;

  final String boxName = 'box';

  Future<GeneralStorage> init(Paths paths) async {
    final dbPath = join(paths.database, 'hive_db');
    await Hive.initFlutter(dbPath);
    _box = await Hive.openBox(boxName);
    return this;
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
