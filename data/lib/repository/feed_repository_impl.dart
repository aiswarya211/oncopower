import 'package:dartz/dartz.dart';
import 'package:data/entity/feed/add_post_response_entity.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:data/entity/feed/like_response_entity.dart';
import 'package:data/network/safe_api.dart';
import 'package:data/source/feed/feed_data_source.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/repository/feed_repository.dart';

class FeedRepositoryImpl extends FeedRepository {
  final FeedRemoteDS _remoteDS;
  FeedRepositoryImpl(this._remoteDS);

  @override
  Future<Either<NetworkError, FeedResponseEntity>> getFeed() async {
    final result = await safeApiCall(
      _remoteDS.getFeed(),
    );

    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<NetworkError, LikeResponseEntity>> like(
      {required bool isLike, required int count, required int postId}) async {
    final result = await safeApiCall(
      _remoteDS.like(isLike: isLike, count: count, postId: postId),
    );
    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<NetworkError, AddPostResponseEntity>> addPost(
      {required String description, required int? visibility}) async {
    final result = await safeApiCall(
      _remoteDS.addPost(description: description, visibility: visibility),
    );
    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }
}
