import 'package:data/entity/feed/add_post_response_entity.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:data/entity/feed/like_response_entity.dart';
import 'package:data/entity/request/add_post_request.dart';
import 'package:data/entity/request/like_request.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/feed/feed_data_source.dart';
import 'package:retrofit/retrofit.dart';

class FeedRemoteDSImpl implements FeedRemoteDS {
  final ApiService _apiService;

  FeedRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<FeedResponseEntity>> getFeed() {
    return _apiService.getFeed();
  }

  @override
  Future<HttpResponse<LikeResponseEntity>> like(
      {required bool isLike, required int count, required int postId}) {
    return _apiService
        .like(LikeDataRequest(islike: isLike, count: count, postId: postId));
  }

  @override
  Future<HttpResponse<AddPostResponseEntity>> addPost(
      {required String? description, required int? visibility}) {
    return _apiService.addPost(
        AddPostRequest(description: description, visibility: visibility));
  }
}
