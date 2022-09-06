import 'package:dartz/dartz.dart';
import 'package:data/entity/login/login_response_entity.dart';
import 'package:domain/error/network_error.dart';

abstract class LoginRepository {
  Future<Either<NetworkError, LoginResponseEntity>> login(
      {required String email, required String password});
}