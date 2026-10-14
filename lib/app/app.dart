import 'package:app/app/router.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/app/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final themeCubit = ThemeCubit();
  final localeCubit = LocaleCubit(AppLocalizations.supportedLocales);
  final connectivityCubit = ConnectivityCubit();

  @override
  void dispose() {
    themeCubit.close();
    localeCubit.close();
    connectivityCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: themeCubit),
        BlocProvider.value(value: localeCubit),
        BlocProvider.value(value: connectivityCubit),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, state) {
          final locale = state;
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, state) {
              final themeMode = state;
              return MaterialApp.router(
                title: 'App',
                theme: themeCubit.fLightTheme.toApproximateMaterialTheme(),
                darkTheme: themeCubit.fDarkTheme.toApproximateMaterialTheme(),
                themeMode: themeMode,
                locale: locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  ...GlobalMaterialLocalizations.delegates,
                  ...FLocalizations.localizationsDelegates,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter,
                builder: (context, child) {
                  return FTheme(
                    data: themeCubit.getTheme(
                      MediaQuery.platformBrightnessOf(context),
                    ),
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
