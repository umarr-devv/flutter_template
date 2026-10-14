import 'dart:ui';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class LocaleCubit extends HydratedCubit<Locale> {
  LocaleCubit(this.supportedLocales)
    : super(_getDefaultLocale(supportedLocales));

  final String key = 'value';
  final List<Locale> supportedLocales;

  void setLocale(Locale locale) {
    emit(locale);
  }

  void nextLocale() {
    final currentLocale = supportedLocales.indexWhere(
      (l) => l.languageCode == state.languageCode,
    );
    emit(supportedLocales[(currentLocale + 1) % supportedLocales.length]);
  }

  static Locale _getDefaultLocale(List<Locale> supportedLocales) {
    final systemLocale = PlatformDispatcher.instance.locale;

    final isSupported = supportedLocales.any(
      (locale) => locale.languageCode == systemLocale.languageCode,
    );
    return isSupported ? systemLocale : supportedLocales.first;
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) => Locale(json[key]);

  @override
  Map<String, dynamic>? toJson(Locale state) => {key: state.languageCode};
}
