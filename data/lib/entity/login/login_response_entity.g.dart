// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseEntity _$LoginResponseEntityFromJson(Map<String, dynamic> json) =>
    LoginResponseEntity(
      json['message'] as String?,
      json['error'] as String?,
      json['loginData'] == null
          ? null
          : LoginData.fromJson(json['loginData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseEntityToJson(
        LoginResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'loginData': instance.loginData,
    };
