import 'package:data/entity/base_entity.dart';
import 'package:data/entity/login/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_entity.g.dart';

@JsonSerializable()
class LoginResponseEntity extends BaseEntity {
  @JsonKey(name: 'token')
  final String? token;
  final UserEntity? user;

  LoginResponseEntity(String? message, String? error, this.token, this.user)
      : super(message, error);

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) => _$LoginResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);
}
