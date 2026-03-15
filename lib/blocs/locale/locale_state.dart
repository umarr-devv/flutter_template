part of 'locale_cubit.dart';

@JsonSerializable()
class LocaleState extends Equatable {
  const LocaleState({required this.languageCode});

  final String languageCode;

  Locale get locale => Locale(languageCode);

  factory LocaleState.fromJson(Map<String, dynamic> json) =>
      _$LocaleStateFromJson(json);

  Map<String, dynamic> toJson() => _$LocaleStateToJson(this);

  @override
  List<Object> get props => [languageCode];
}
