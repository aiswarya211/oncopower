import 'package:data/entity/feed/feed_response_entity.dart';
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
}
