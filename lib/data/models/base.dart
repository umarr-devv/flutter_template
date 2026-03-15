import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base.g.dart';

@JsonSerializable()
class BaseModel extends Equatable {
  const BaseModel({
    required this.id,
    required this.createAt,
    required this.updateAt,
  });

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'create_at')
  final DateTime createAt;

  @JsonKey(name: 'update_at')
  final DateTime updateAt;

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  @override
  List<Object?> get props => [id];
}
