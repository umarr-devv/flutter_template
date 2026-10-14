import 'package:app/app/paths.dart';
import 'package:app/client/client.dart';
import 'package:app/core/storage/general_storage.dart';
import 'package:app/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String envFile = '.env';

Future setupDependencies() async {
  await dotenv.load(fileName: envFile);

  final talker = Talker();
  final paths = await Paths().init();
  final dio = await setupDio(paths: paths, talker: talker);

  GetIt.I.registerSingleton(talker);
  GetIt.I.registerSingleton(paths);
  GetIt.I.registerSingleton(dio);

  GetIt.I.registerSingleton(await PackageInfo.fromPlatform());
  GetIt.I.registerSingleton(await setupHydratedStorage(paths));
  GetIt.I.registerSingleton(await GeneralStorage().init(paths));
  GetIt.I.registerSingleton(SecureStorage());
  GetIt.I.registerSingleton(Client(dio));
}

Future<Dio> setupDio({required Paths paths, required Talker talker}) async {
  final cookieJar = PersistCookieJar(storage: FileStorage(paths.cookies));
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 5),
      sendTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  dio.interceptors.addAll([
    TalkerDioLogger(talker: GetIt.I<Talker>()),
    CookieManager(cookieJar),
  ]);

  return dio;
}

Future<HydratedStorage> setupHydratedStorage(Paths paths) async {
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(paths.database),
  );
  HydratedBloc.storage = storage;
  return storage;
}
