part of 'settings_cubit.dart';

@JsonSerializable()
class SettingsState extends Equatable {
  const SettingsState({required this.languageCode, required this.isDarkTheme});

  final String languageCode;
  final bool isDarkTheme;


  Locale get locale => Locale(languageCode);

  SettingsState copyWith({String? languageCode, bool? isDarkTheme}) {
    return SettingsState(
      languageCode: languageCode ?? this.languageCode,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);

  @override
  List<Object> get props => [languageCode, isDarkTheme];
}
