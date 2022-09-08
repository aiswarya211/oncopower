import 'package:data/entity/login/login_response_entity.dart';
import 'package:data/entity/register/register_response_entity.dart';
import 'package:data/entity/request/login_request.dart';
import 'package:data/entity/request/register_request.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/login/login_data_source.dart';
import 'package:retrofit/retrofit.dart';

class LoginRemoteDSImpl implements LoginRemoteDS {
  final ApiService _apiService;

  LoginRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<LoginResponseEntity>> login(
      {required String email, required String password}) {
    return _apiService.login(LoginRequest(email: email, password: password));
  }

  @override
  Future<HttpResponse<RegisterResponseEntity>> register(
      {required String emailId,
      required String firstName,
      required String lastName,
      required String password,
      required String source,
      required String userType}) {
    return _apiService.register(
      RegisterRequest(
          emailId: emailId,
          password: password,
          firstName: firstName,
          lastName: lastName,
          source: source,
          userType: userType),
    );
  }
}
