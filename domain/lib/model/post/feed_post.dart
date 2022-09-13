// ignore_for_file: must_be_immutable

import 'package:data/entity/login/user_entity.dart';
import 'package:data/helper/base_equatable.dart';

class FeedPost extends BaseEquatable {
  int? id;
  int? userId;
  String? description;
  int? likeCount;
  int? shareCount;
  int? commentCount;
  int? totalCommentCount;
  String? createdAt;
  String? updatedAt;
  String? postUrl;
  UserEntity? user;
  bool? islike;

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

  @override
  List<Object?> get props => [id];
}
