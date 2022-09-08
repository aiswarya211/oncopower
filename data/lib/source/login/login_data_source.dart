import 'package:data/entity/login/login_response_entity.dart';
import 'package:data/entity/register/register_response_entity.dart';
import 'package:retrofit/dio.dart';

abstract class LoginRemoteDS {
  Future<HttpResponse<LoginResponseEntity>> login(
      {required String email, required String password});

  Future<HttpResponse<RegisterResponseEntity>> register(
      {required String emailId,
      required String firstName,
      required String lastName,
      required String password,
      required String source,
      required String userType});
}
