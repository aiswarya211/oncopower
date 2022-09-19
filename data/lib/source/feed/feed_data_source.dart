import 'package:data/entity/feed/add_post_response_entity.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:data/entity/feed/like_response_entity.dart';

import 'package:retrofit/dio.dart';

abstract class FeedRemoteDS {
  Future<HttpResponse<FeedResponseEntity>> getFeed();

  Future<HttpResponse<LikeResponseEntity>> like(
      {required bool isLike, required int count, required int postId});

  Future<HttpResponse<AddPostResponseEntity>> addPost({
    required String? description,
    required int? visibility,
  });
}
