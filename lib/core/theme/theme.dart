import 'package:app/core/theme/box.dart';
import 'package:app/core/theme/color_schemes/color_schemes.dart';
import 'package:app/core/theme/radius.dart';
import 'package:app/core/theme/spacing.dart';
import 'package:app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
   AppTheme(this.colorScheme);
  
  final ColorScheme colorScheme;

  final textStyles =  AppTextStyles();
  final spacing = AppSpacing();
  final box = AppBox();
  final radius = AppRadius();

  ThemeData get toTheme {
    return ThemeData(
      brightness: colorScheme.brightness,
      fontFamily: textStyles.fontFamily,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: colorScheme.surface,
        selectedIconTheme: IconThemeData(color: colorScheme.primary),
      ),
      appBarTheme: AppBarThemeData(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: colorScheme.surface,
        elevation: 0,
        centerTitle: false,
        actionsPadding: EdgeInsets.only(right: spacing.md),
      ),
    );
  }
}

extension ThemeDataExtension on ThemeData {
  AppTheme get app => AppTheme(colorScheme);
}

ThemeData get lightTheme => AppTheme(lightColorScheme).toTheme;
ThemeData get darkTheme => AppTheme(darkColorScheme).toTheme;
