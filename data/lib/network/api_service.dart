import 'package:data/entity/login/login_response_entity.dart';
import 'package:data/entity/request/login_request.dart';
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
      
}
