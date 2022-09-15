// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostRequest _$AddPostRequestFromJson(Map<String, dynamic> json) =>
    AddPostRequest(
      description: json['description'] as String?,
      visibility: json['visibility'] as int?,
    );

Map<String, dynamic> _$AddPostRequestToJson(AddPostRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'visibility': instance.visibility,
    };
