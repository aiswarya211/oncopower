import 'package:data/entity/feed/feed_response_entity.dart';

import 'package:retrofit/dio.dart';

abstract class FeedRemoteDS {
  Future<HttpResponse<FeedResponseEntity>> getFeed();
}
