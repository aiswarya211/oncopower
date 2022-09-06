// ignore_for_file: unused_field

import 'package:data/network/preference_helper.dart';
import 'package:domain/usecase/login/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:oncopower/base/base_page_view_model.dart';
import 'package:oncopower/utils/color_resources.dart';

import 'package:oncopower/utils/image_resources.dart';
import 'package:oncopower/utils/request_manager.dart';
import 'package:oncopower/utils/resource.dart';
import 'package:oncopower/utils/status.dart';

import '../utils/app_subject.dart';

class LoginPageViewModel extends BasePageViewModel with LoginViewModelStreams {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Stream<Resource<bool>> get isLoggedIn => _loginResponse.stream;

  Stream<Resource<bool>> get passwordObscured => _passwordObscure.stream;

  String trailingImage = ImageResource.onVisionIcon;

  Color eyeColor = ColorResource.hashgray;

  final LoginUseCase _loginUseCase;

  LoginPageViewModel(
    this._loginUseCase,
  ) {
    listenLoginRequest();
  }

  void listenLoginRequest() {
    _loginRequest.listen((value) {
      RequestManager(value,
              createCall: () => _loginUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        updateLoader();
        if (event.status == Status.error) {
          showToastWithError(event.appError!);
          showErrorState();
        }

        if (event.status == Status.success) {
          await PreferenceHelper.saveToken(event.data!.token);
          await PreferenceHelper.saveUser(event.data!.user);
        }
        print(['hiii',event.data!.token]);
      });
    });
  }

  void loginOnTap() {
    _loginRequest
        .add(LoginUseCaseParams(emailController.text, passwordController.text));
        
  }

  void passwordVisibleChange() {
    _passwordObscure
        .add(Resource.success(data: !_passwordObscure.value!.data!));
    if (_passwordObscure.value!.data!) {
      trailingImage = ImageResource.onVisionIcon;
      eyeColor = ColorResource.hashgray;
    } else {
      trailingImage = ImageResource.onVisionIcon;
      eyeColor = ColorResource.mediumBlue;
    }
  }
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
