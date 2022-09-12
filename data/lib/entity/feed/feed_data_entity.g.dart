// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedData _$FeedDataFromJson(Map<String, dynamic> json) => FeedData(
      feedList: (json['list'] as List<dynamic>)
          .map((e) => FeedList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedDataToJson(FeedData instance) => <String, dynamic>{
      'list': instance.feedList,
    };

FeedList _$FeedListFromJson(Map<String, dynamic> json) => FeedList(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      feedMessage: json['feed_message'] == null
          ? null
          : FeedMessage.fromJson(json['feed_message'] as Map<String, dynamic>),
      feedPost: json['post'] == null
          ? null
          : FeedPost.fromJson(json['post'] as Map<String, dynamic>),
      ownerId: json['owner_id'] as int?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$FeedListToJson(FeedList instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'feed_message': instance.feedMessage,
      'post': instance.feedPost,
    };

FeedMessage _$FeedMessageFromJson(Map<String, dynamic> json) => FeedMessage(
      ownertype: json['owner_type'] as String?,
      respondertype: json['responder_type'] as String?,
      ownerLastName: json['owner_last_name'] as String?,
      ownerFirstName: json['owner_first_name'] as String?,
      responderFirstName: json['responder_first_name'] as String?,
      responderLastName: json['responder_last_name'] as String?,
    );

Map<String, dynamic> _$FeedMessageToJson(FeedMessage instance) =>
    <String, dynamic>{
      'owner_type': instance.ownertype,
      'responder_type': instance.respondertype,
      'owner_last_name': instance.ownerLastName,
      'owner_first_name': instance.ownerFirstName,
      'responder_first_name': instance.responderFirstName,
      'responder_last_name': instance.responderLastName,
    };

FeedPost _$FeedPostFromJson(Map<String, dynamic> json) => FeedPost(
      description: json['description'] as String?,
      likeCount: json['like_count'] as int?,
      shareCount: json['share_count'] as int?,
      commentCount: json['comment_count'] as int?,
      totalCommentCount: json['total_comment_count'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      media: (json['comments'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      postUrl: json['dynamic_link'] as String?,
      islike: json['is_like'] as bool?,
      id: json['id'] as int?,
    )..userId = json['user_id'] as int?;

Map<String, dynamic> _$FeedPostToJson(FeedPost instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'description': instance.description,
      'like_count': instance.likeCount,
      'share_count': instance.shareCount,
      'comment_count': instance.commentCount,
      'total_comment_count': instance.totalCommentCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'dynamic_link': instance.postUrl,
      'user': instance.user,
      'is_like': instance.islike,
      'comments': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: json['id'] as int?,
      image: json['relative_path'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'relative_path': instance.image,
    };
