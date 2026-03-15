import 'package:app/core/paths/paths.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path/path.dart';

class HydratedStorageSetup {
  static Future init(AppPaths paths) async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory(join(paths.cachePath, 'hyrated')),
    );
  }
}
