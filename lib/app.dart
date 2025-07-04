import 'package:app/core/router/router.dart';
import 'package:app/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  AppScreen({super.key});

  final appRoute = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Template',
      theme: lightTheme,
      routerConfig: appRoute.config(),
    );
  }
}
