import 'package:app/blocs/blocs.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/theme/theme.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) => LocaleCubit(AppLocalizations.supportedLocales),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, theme) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, locale) {
              return MaterialApp.router(
                title: 'App',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: theme.themeMode,
                debugShowCheckedModeBanner: false,
                locale: locale.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}
