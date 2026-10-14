// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get home => 'Главная';

  @override
  String get search => 'Поиск';

  @override
  String get favorite => 'Избранные';

  @override
  String get profile => 'Профиль';

  @override
  String get detail => 'Подробнее';

  @override
  String get appName => 'Название приложения';

  @override
  String get packageName => 'Название пакета';

  @override
  String get version => 'Версия';

  @override
  String get buildNumber => 'Номер сборки';

  @override
  String get toggle => 'Переключить';
}
