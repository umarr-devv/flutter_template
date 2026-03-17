import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme(Brightness brightness) : colors = AppColors(brightness: brightness);

  final typography = AppTypography();
  final AppColors colors;

  ThemeData get toTheme {
    return ThemeData(
      brightness: colors.brightness,
      fontFamily: typography.fontFamily,
      colorScheme: colors.toColorScheme(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: colors.surface,
        selectedIconTheme: IconThemeData(color: colors.primary),
      ),
      appBarTheme: AppBarThemeData(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        surfaceTintColor: colors.surface,
        elevation: 0,
        centerTitle: false,
        actionsPadding: EdgeInsets.only(right: 16),
      ),
    );
  }
}

extension ThemeDataExtension on ThemeData {
  AppColors get colors => AppTheme(brightness).colors;
  AppTypography get typography => AppTheme(brightness).typography;
}

ThemeData get lightTheme => AppTheme(Brightness.light).toTheme;
ThemeData get darkTheme => AppTheme(Brightness.dark).toTheme;
