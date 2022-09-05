// ignore_for_file: unused_field

import 'package:data/source/login/login_data_source.dart';
import 'package:domain/error/network_error.dart';
import 'package:data/entity/login/login_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository{
    final LoginRemoteDS _remoteDS;
  LoginRepositoryImpl(this._remoteDS);




  @override
  Future<Either<NetworkError, LoginResponseEntity>> login({required String email, required String password}) {

    throw UnimplementedError();
  }

}