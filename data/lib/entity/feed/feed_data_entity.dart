import 'package:data/entity/login/user_entity.dart';
import 'package:data/helper/base_equatable.dart';
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
  FeedPost? feedPost;

  FeedList(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.feedMessage,
      this.feedPost,
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
class FeedPost extends BaseEquatable {
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
  List<Media>? media;

  FeedPost(
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
  factory FeedPost.fromJson(Map<String, dynamic> json) =>
      _$FeedPostFromJson(json);
  Map<String, dynamic> toJson() => _$FeedPostToJson(this);

  @override
  List<Object?> get props => [id];
}

@JsonSerializable()
class Media {
  int? id;
  @JsonKey(name: 'relative_path')
  String? image;

  Media({this.id, this.image});
  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
