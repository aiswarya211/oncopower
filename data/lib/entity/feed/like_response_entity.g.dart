// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeResponseEntity _$LikeResponseEntityFromJson(Map<String, dynamic> json) =>
    LikeResponseEntity(
      likeData: json['data'] == null
          ? null
          : LikeData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LikeResponseEntityToJson(LikeResponseEntity instance) =>
    <String, dynamic>{
      'data': instance.likeData,
      'message': instance.message,
    };
