import 'package:flutter/material.dart';

class AppColors {
  AppColors({required this.brightness});

  final Brightness brightness;

  Color by(Color light, Color dark) {
    if (brightness == Brightness.light) {
      return light;
    }
    return dark;
  }

  Color get surface => by(Color(0xFFFFFFFF), Color(0xFF080808));

  Color get onSurface => by(Color(0xFF111111), Color(0xFFF1F1F1));

  Color get onSurfaceVariant => by(Color(0xFF393939), Color(0xFFCACACA));

  Color get primary => by(Color(0xFF2563EB), Color(0xFF3B82F6));

  Color get onPrimary => by(Color(0xFFFFFFFF), Color(0xFFFFFFFF));

  Color get secondary => by(Color(0xFFF1F5F9), Color(0xFF1E293B));

  Color get onSecondary => by(Color(0xFF000000), Color(0xFFFFFFFF));

  Color get error => by(Color(0xFFEF4444), Color(0xFF7F1D1D));

  Color get onError => by(Color(0xFFFFFFFF), Color(0xFFFFFFFF));

  Color get outline => by(Color(0xFF919191), Color(0xFF777777));

  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      surface: surface,
      onSurface: onSurface,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
    );
  }
}
