import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

Future setupErrors() async {
  FlutterError.onError = (details) =>
      GetIt.I<Talker>().handle(details.exception, details.stack);
  PlatformDispatcher.instance.onError = (exc, st) {
    GetIt.I<Talker>().handle(exc, st);
    return true;
  };
  Bloc.observer = TalkerBlocObserver(talker: GetIt.I<Talker>());
}
