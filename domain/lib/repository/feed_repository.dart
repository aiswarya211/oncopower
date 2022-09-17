import 'package:dartz/dartz.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:domain/error/network_error.dart';

abstract class FeedRepository {
  Future<Either<NetworkError, FeedResponseEntity>> getFeed();
}
