part of 'theme_cubit.dart';

@JsonSerializable()
class ThemeState extends Equatable {
  const ThemeState(this.themeMode);

  final ThemeMode themeMode;

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeStateToJson(this);

  @override
  List<Object> get props => [themeMode];
}
