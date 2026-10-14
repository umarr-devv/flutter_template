import 'package:app/theme/theme.dart';
import 'package:forui/forui.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:material_ui/material_ui.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(.system);

  final String key = 'value';

  FThemeData get fLightTheme => lightTheme;
  FThemeData get fDarkTheme => darkTheme;

  void setThemeMode(ThemeMode themeMode) {
    emit(themeMode);
  }

  Brightness? get brightness {
    switch (state) {
      case .light:
        return .light;
      case .dark:
        return .dark;
      default:
        return null;
    }
  }

  FThemeData getTheme(Brightness systemBrightness) {
    final brightness_ = brightness ?? systemBrightness;
    switch (brightness_) {
      case .light:
        return fLightTheme;
      case .dark:
        return fDarkTheme;
    }
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) =>
      ThemeMode.values.byName(json[key]);

  @override
  Map<String, dynamic>? toJson(ThemeMode state) => {key: state.name};
}
