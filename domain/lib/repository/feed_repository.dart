import 'package:dartz/dartz.dart';
import 'package:data/entity/feed/add_post_response_entity.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:data/entity/feed/like_response_entity.dart';

import 'package:domain/error/network_error.dart';

abstract class FeedRepository {
  Future<Either<NetworkError, FeedResponseEntity>> getFeed();
  Future<Either<NetworkError, LikeResponseEntity>> like(
      {required bool isLike, required int count, required int postId});
  Future<Either<NetworkError, AddPostResponseEntity>> addPost(
      {required String description, required int? visibility});
}
