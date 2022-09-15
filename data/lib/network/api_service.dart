import 'package:data/entity/feed/add_post_response_entity.dart';
import 'package:data/entity/feed/feed_response_entity.dart';
import 'package:data/entity/feed/like_response_entity.dart';
import 'package:data/entity/login/login_response_entity.dart';
import 'package:data/entity/register/register_response_entity.dart';
import 'package:data/entity/request/add_post_request.dart';
import 'package:data/entity/request/like_request.dart';
import 'package:data/entity/request/login_request.dart';
import 'package:data/entity/request/register_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("/login")
  Future<HttpResponse<LoginResponseEntity>> login(
      @Body() LoginRequest loginRequest);

  @POST("/register")
  Future<HttpResponse<RegisterResponseEntity>> register(
      @Body() RegisterRequest registerRequest);

  @GET("/user/get-feed?limit=40&listing_type=all_feed")
  Future<HttpResponse<FeedResponseEntity>> getFeed();

  @POST("/user/post-like")
  Future<HttpResponse<LikeResponseEntity>> like(
      @Body() LikeDataRequest likeDataRequest);

  @POST("/user/add-post")
  Future<HttpResponse<AddPostResponseEntity>> addPost(
      @Body() AddPostRequest addPostRequest);
}
