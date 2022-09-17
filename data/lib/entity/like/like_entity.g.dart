// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeData _$LikeDataFromJson(Map<String, dynamic> json) => LikeData(
      islike: json['is_like'] as bool?,
      count: json['like_count'] as int?,
    );

Map<String, dynamic> _$LikeDataToJson(LikeData instance) => <String, dynamic>{
      'is_like': instance.islike,
      'like_count': instance.count,
    };
