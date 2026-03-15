import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'locale_cubit.g.dart';
part 'locale_state.dart';

class LocaleCubit extends HydratedCubit<LocaleState> {
  LocaleCubit(List<Locale> supportedLocales)
    : super(
        LocaleState(
          languageCode: _getDefaultLocale(supportedLocales).languageCode,
        ),
      );

  void setLocale(Locale locale) {
    emit(LocaleState(languageCode: locale.languageCode));
  }

  static Locale _getDefaultLocale(List<Locale> supportedLocales) {
    final systemLocale = PlatformDispatcher.instance.locale;

    final isSupported = supportedLocales.any(
      (locale) => locale.languageCode == systemLocale.languageCode,
    );

    return isSupported ? systemLocale : supportedLocales.first;
  }

  @override
  LocaleState? fromJson(Map<String, dynamic> json) {
    return LocaleState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(LocaleState state) {
    return state.toJson();
  }
}
