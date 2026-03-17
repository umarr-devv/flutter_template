import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings_cubit.g.dart';
part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit(List<Locale> supportedLocales)
    : super(
        SettingsState(
          languageCode: _getDefaultLocale(supportedLocales).languageCode,
          isDarkTheme: _getIsDarkTheme(),
        ),
      );

  void switchTheme() {
    emit(state.copyWith(isDarkTheme: !state.isDarkTheme));
  }

  void setLocale(Locale locale) {
    emit(state.copyWith(languageCode: locale.languageCode));
  }

  static Locale _getDefaultLocale(List<Locale> supportedLocales) {
    final systemLocale = PlatformDispatcher.instance.locale;

    final isSupported = supportedLocales.any(
      (locale) => locale.languageCode == systemLocale.languageCode,
    );
    return isSupported ? systemLocale : supportedLocales.first;
  }

  static bool _getIsDarkTheme() {
    return Brightness.dark == PlatformDispatcher.instance.platformBrightness;
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toJson();
  }
}
