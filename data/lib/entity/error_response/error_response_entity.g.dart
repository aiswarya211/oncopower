// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseEntity _$ErrorResponseEntityFromJson(Map<String, dynamic> json) =>
    ErrorResponseEntity(
      code: json['code'] as int?,
      content: json['content'],
      exceptionMessage: json['exceptionMessage'] as String?,
      message: json['error_message'],
      token: json['token'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ErrorResponseEntityToJson(
        ErrorResponseEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'error_message': instance.message,
      'token': instance.token,
      'content': instance.content,
      'exceptionMessage': instance.exceptionMessage,
      'id': instance.id,
    };
