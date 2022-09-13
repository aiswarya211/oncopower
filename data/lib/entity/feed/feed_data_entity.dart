// ignore_for_file: must_be_immutable

import 'package:data/entity/login/user_entity.dart';
import 'package:domain/model/post/feed_post.dart';
import 'package:domain/utils/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feed_data_entity.g.dart';

@JsonSerializable()
class FeedData {
  @JsonKey(name: 'list')
  List<FeedList> feedList;
  FeedData({required this.feedList});
  factory FeedData.fromJson(Map<String, dynamic> json) =>
      _$FeedDataFromJson(json);
  Map<String, dynamic> toJson() => _$FeedDataToJson(this);
}

@JsonSerializable()
class FeedList {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'owner_id')
  int? ownerId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'feed_message')
  FeedMessage? feedMessage;
  @JsonKey(name: 'post')
  FeedPostEntity? feedPostEntity;

  FeedList(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.feedMessage,
      this.feedPostEntity,
      this.ownerId,
      this.userId});

  factory FeedList.fromJson(Map<String, dynamic> json) =>
      _$FeedListFromJson(json);
  Map<String, dynamic> toJson() => _$FeedListToJson(this);
}

@JsonSerializable()
class FeedMessage {
  @JsonKey(name: 'owner_type')
  String? ownertype;
  @JsonKey(name: 'responder_type')
  String? respondertype;
  @JsonKey(name: 'owner_last_name')
  String? ownerLastName;
  @JsonKey(name: 'owner_first_name')
  String? ownerFirstName;
  @JsonKey(name: 'responder_first_name')
  String? responderFirstName;
  @JsonKey(name: 'responder_last_name')
  String? responderLastName;

  FeedMessage({
    this.ownertype,
    this.respondertype,
    this.ownerLastName,
    this.ownerFirstName,
    this.responderFirstName,
    this.responderLastName,
  });

  factory FeedMessage.fromJson(Map<String, dynamic> json) =>
      _$FeedMessageFromJson(json);
  Map<String, dynamic> toJson() => _$FeedMessageToJson(this);
}

@JsonSerializable()
class FeedPostEntity
    implements BaseLayerDataTransformer<FeedPostEntity, FeedPost> {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'like_count')
  int? likeCount;
  @JsonKey(name: 'share_count')
  int? shareCount;
  @JsonKey(name: 'comment_count')
  int? commentCount;
  @JsonKey(name: 'total_comment_count')
  int? totalCommentCount;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'dynamic_link')
  String? postUrl;
  @JsonKey(name: 'user')
  UserEntity? user;
  @JsonKey(name: 'is_like')
  bool? islike;
  @JsonKey(name: 'comments')
  // List<CommentList>? commentList;
  List<MediaEntity>? media;

  FeedPostEntity(
      {this.description,
      this.likeCount,
      this.shareCount,
      this.commentCount,
      this.totalCommentCount,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.media,
      this.postUrl,
      this.islike,
      this.id});
  factory FeedPostEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedPostEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FeedPostEntityToJson(this);

  @override
  FeedPostEntity restore(FeedPost? data) {
    throw UnimplementedError();
  }

  @override
  FeedPost transform() {
    return FeedPost(
        id: id,
        description: description,
        likeCount: likeCount,
        shareCount: shareCount,
        commentCount: commentCount,
        totalCommentCount: totalCommentCount,
        createdAt: createdAt,
        updatedAt: updatedAt,
        user: user,
        media: media?.map((e) => e.transform()).toList(),
        postUrl: postUrl,
        islike: islike);
  }
}

@JsonSerializable()
class MediaEntity implements BaseLayerDataTransformer<MediaEntity, Media> {
  int? id;
  @JsonKey(name: 'relative_path')
  String? image;

  MediaEntity({this.id, this.image});
  factory MediaEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MediaEntityToJson(this);

  @override
  MediaEntity restore(Media? data) {
    throw UnimplementedError();
  }

  @override
  Media transform() {
    return Media(
      id: id,
      image: image,
    );
  }
}
