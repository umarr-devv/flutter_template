import 'package:flutter/material.dart';

class CustomThemeData {
  CustomThemeData({required this.brightness});

  final Brightness brightness;

  final font = 'Manrope';

  Color by({required Color light, required Color dark}) {
    return brightness == Brightness.light ? light : dark;
  }

  Color get primaryColor => Color(0xffad46ff);

  Color get primaryBackground {
    return Color(0xff6200ee);
  }

  Color get secondaryBackground {
    return by(light: const Color(0xFFeeeff0), dark: const Color(0xFF090909));
  }

  Color get primaryForeground {
    return by(light: const Color(0xFF000000), dark: const Color(0xFFFFFFFF));
  }

  Color get secondaryForeground => primaryForeground.withValues(alpha: 0.75);

  ThemeData toTheme() {
    return ThemeData(
      brightness: brightness,
      primaryColor: primaryBackground,
      scaffoldBackgroundColor: secondaryBackground,
      fontFamily: font,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryBackground,
        onPrimary: primaryForeground,
        secondary: secondaryBackground,
        onSecondary: secondaryForeground,
        surface: secondaryBackground,
        onSurface: primaryForeground,
      ).copyWith(secondary: secondaryForeground),
    );
  }
}

extension ThemeExtension on ThemeData {
  CustomThemeData get custom => CustomThemeData(brightness: brightness);
}

final lightTheme = CustomThemeData(brightness: Brightness.light).toTheme();
final darkTheme = CustomThemeData(brightness: Brightness.dark).toTheme();
