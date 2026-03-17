// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    SettingsState(
      languageCode: json['languageCode'] as String,
      isDarkTheme: json['isDarkTheme'] as bool,
    );

Map<String, dynamic> _$SettingsStateToJson(SettingsState instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'isDarkTheme': instance.isDarkTheme,
    };
