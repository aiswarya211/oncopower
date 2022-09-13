// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponseEntity _$FeedResponseEntityFromJson(Map<String, dynamic> json) =>
    FeedResponseEntity(
      feed: json['data'] == null
          ? null
          : FeedData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedResponseEntityToJson(FeedResponseEntity instance) =>
    <String, dynamic>{
      'data': instance.feed,
    };
