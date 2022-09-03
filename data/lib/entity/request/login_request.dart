import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'username')
  final String? email;
  final String? password;

  LoginRequest({
    this.email,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> jsonMap) =>
      _$LoginRequestFromJson(jsonMap);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
