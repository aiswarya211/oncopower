import 'package:json_annotation/json_annotation.dart';
part 'register_response_entity.g.dart';

@JsonSerializable()
class RegisterResponseEntity {
  final String? message;

  RegisterResponseEntity({this.message});

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseEntityToJson(this);
}