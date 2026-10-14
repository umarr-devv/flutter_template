import 'package:equatable/equatable.dart';

class BaseModel extends Equatable {
  final String? id;

  const new({required this.id});

  @override
  List<Object?> get props => [id];
}
