import 'package:json_annotation/json_annotation.dart';
part 'error_response_entity.g.dart';

@JsonSerializable()
class ErrorResponseEntity {
  @JsonKey(name: "code")
  final int? code;
  @JsonKey(name: "error")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "content")
  final dynamic content;
  @JsonKey(name: "exceptionMessage")
  final String? exceptionMessage;
  @JsonKey(name: "id")
  final String? id;

  ErrorResponseEntity(
      {this.code,
      this.content,
      this.exceptionMessage,
      this.message,
      this.token,
      this.id});

  factory ErrorResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseEntityToJson(this);
}