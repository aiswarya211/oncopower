// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      emailId: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      password: json['password'] as String?,
      source: json['source'] as String?,
      userType: json['user_type'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.emailId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'password': instance.password,
      'source': instance.source,
      'user_type': instance.userType,
    };
