// ignore_for_file: unused_field

import 'package:data/entity/register/register_response_entity.dart';
import 'package:data/network/safe_api.dart';
import 'package:data/source/login/login_data_source.dart';
import 'package:domain/error/network_error.dart';
import 'package:data/entity/login/login_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/repository/login_repository.dart';


class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDS _remoteDS;
  LoginRepositoryImpl(this._remoteDS);

  @override
  Future<Either<NetworkError, LoginResponseEntity>> login(
      {required String email, required String password}) async {
    final result = await safeApiCall(
      _remoteDS.login(email: email, password: password),
    );

    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<NetworkError, RegisterResponseEntity>> register(
      {required String emailId,
      required String firstName,
      required String lastName,
      required String password,
      required String source,
      required String userType}) async {
    final result = await safeApiCall(
      _remoteDS.register(
          emailId: emailId,
          firstName: firstName,
          lastName: lastName,
          password: password,
          source: source,
          userType: userType),
    );
    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }
}
