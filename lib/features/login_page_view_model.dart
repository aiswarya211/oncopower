// ignore_for_file: unused_field

import 'package:domain/usecase/login/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:oncopower/base/base_page_view_model.dart';

import 'package:oncopower/utils/image_resources.dart';
import 'package:oncopower/utils/resource.dart';

import '../utils/app_subject.dart';

class LoginPageViewModel extends BasePageViewModel with LoginViewModelStreams {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Stream<Resource<bool>> get isLoggedIn => _loginResponse.stream;

  Stream<Resource<bool>> get passwordObscured => _passwordObscure.stream;

  String trailingImage = ImageResource.onVisionIcon;

  final LoginUseCase _loginUseCase;

  LoginPageViewModel(
    this._loginUseCase,
  ) {
    listenLoginRequest();
  }

  void listenLoginRequest() {}
}

mixin LoginViewModelStreams {
  // Request Streams
  final _loginRequest = AppStream<LoginUseCaseParams>();

  // Response Streams
  final _loginResponse = AppStream<Resource<bool>>(
      preserveState: true, initialValue: Resource.success(data: false));

  final _passwordObscure =
      AppStream<Resource<bool>>(initialValue: Resource.success(data: true));
}
