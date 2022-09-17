import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'email')
  String? emailId;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'source')
  String? source;
  @JsonKey(name: 'user_type')
  String? userType;

  RegisterRequest(
      {this.emailId,
      this.firstName,
      this.lastName,
      this.password,
      this.source,
      this.userType});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
