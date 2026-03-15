// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
  id: json['id'] as String,
  createAt: DateTime.parse(json['create_at'] as String),
  updateAt: DateTime.parse(json['update_at'] as String),
);

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
  'id': instance.id,
  'create_at': instance.createAt.toIso8601String(),
  'update_at': instance.updateAt.toIso8601String(),
};
