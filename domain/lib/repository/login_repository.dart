import 'package:dartz/dartz.dart';
import 'package:data/entity/login/login_response_entity.dart';
import 'package:data/entity/register/register_response_entity.dart';

import 'package:domain/error/network_error.dart';

abstract class LoginRepository {
  Future<Either<NetworkError, LoginResponseEntity>> login(
      {required String email, required String password});

  Future<Either<NetworkError, RegisterResponseEntity>> register(
      {required String emailId,
      required String firstName,
      required String lastName,
      required String password,
      required String source,
      required String userType});
}
