import 'package:domain/usecase/login/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:oncopower/base/base_page_view_model.dart';
import 'package:oncopower/utils/app_subject.dart';
import 'package:oncopower/utils/color_resources.dart';
import 'package:oncopower/utils/image_resources.dart';
import 'package:oncopower/utils/request_manager.dart';
import 'package:oncopower/utils/resource.dart';
import 'package:oncopower/utils/status.dart';

class RegisterPageViewModel extends BasePageViewModel
    with RegisterViewModelStreams {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final String source = "oncopower";
  final String userType = "patient";

  Stream<Resource<bool>> get isLoggedIn => _registerResponse.stream;

  Stream<Resource<bool>> get passwordObscured => _passwordObscure.stream;

  String trailingImage = ImageResource.onVisionIcon;

  Color eyeColor = ColorResource.hashgray;

  final RegisterUseCase _loginUseCase;

  Stream<bool> get registerSucessStream => _registerSucess.stream;

  RegisterPageViewModel(
    this._loginUseCase,
  ) {
    listenLoginRequest();
  }

  void listenLoginRequest() {
    _registerRequest.listen((value) {
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
          showToastWithString(event.data!.message!);
        }
      });
    });
  }

  void signUpOnTap() {
    _registerRequest.add(RegisterUseCaseParams(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        passwordController.text,
        source,
        userType));
  }

  void passwordVisibleChange() {
    _passwordObscure
        .add(Resource.success(data: !_passwordObscure.value!.data!));
    if (_passwordObscure.value!.data!) {
      trailingImage = ImageResource.onVisionIcon;
      eyeColor = ColorResource.hashgray;
    } else {
      trailingImage = ImageResource.onVisionIcon;
      eyeColor = ColorResource.color1fabf1;
    }
  }
}

mixin RegisterViewModelStreams {
  // Request Streams
  final _registerRequest = AppStream<RegisterUseCaseParams>();

  // Response Streams
  final _registerResponse = AppStream<Resource<bool>>(
    preserveState: true,
  );

  final _passwordObscure =
      AppStream<Resource<bool>>(initialValue: Resource.success(data: true));

  final _registerSucess = AppStream<bool>(initialValue: false);
}