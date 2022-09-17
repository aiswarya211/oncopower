// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeDataRequest _$LikeDataRequestFromJson(Map<String, dynamic> json) =>
    LikeDataRequest(
      islike: json['is_like'] as bool?,
      count: json['like_count'] as int?,
    );

Map<String, dynamic> _$LikeDataRequestToJson(LikeDataRequest instance) =>
    <String, dynamic>{
      'is_like': instance.islike,
      'like_count': instance.count,
    };
