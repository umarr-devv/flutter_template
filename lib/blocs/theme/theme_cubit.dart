import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theme_cubit.g.dart';
part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState(ThemeMode.system));

  void switchTheme() {
    if (state.themeMode == ThemeMode.dark) {
      emit(ThemeState(ThemeMode.light));
    } else {
      emit(ThemeState(ThemeMode.dark));
    }
  }

  void setThemeMode(ThemeMode themeMode) {
    emit(ThemeState(themeMode));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
