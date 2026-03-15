import 'package:app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextLocale on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
