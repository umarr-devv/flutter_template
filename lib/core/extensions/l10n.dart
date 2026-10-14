import 'package:app/l10n/app_localizations.dart';
import 'package:material_ui/material_ui.dart';

extension BuildContextLocale on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
