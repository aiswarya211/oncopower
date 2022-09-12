import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/base/base_page.dart';
import 'package:oncopower/di/app_modules.dart';
import 'package:oncopower/di/login_modules.dart';
import 'package:oncopower/features/login/login_page_view_model.dart';
import 'package:oncopower/generated/l10n.dart';
import 'package:oncopower/molecules/app_stream_builder.dart';
import 'package:oncopower/molecules/custom_button.dart';
import 'package:oncopower/molecules/custom_text.dart';
import 'package:oncopower/molecules/custom_textformfield.dart';
import 'package:oncopower/utils/color_resources.dart';
import 'package:oncopower/utils/extensions.dart';
import 'package:oncopower/utils/image_resources.dart';
import 'package:oncopower/utils/resource.dart';
import 'package:oncopower/utils/status.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPageView extends BasePageViewWidget<LoginPageViewModel> {
  const LoginPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);
  @override
  Widget build(BuildContext context, LoginPageViewModel model) {
    return AppStreamBuilder<Resource<bool>>(
        stream: model.isLoggedIn,
        initialData: Resource.success(data: false),
        dataBuilder: (context, snapshot) {
          if (snapshot!.status == Status.success && snapshot.data!) {
            context.read(appViewModelProvider).login();
          }
          return ScreenTypeLayout.builder(
            desktop: (BuildContext context) => const _WebLayout(),
            mobile: (BuildContext context) => const _MobileLayout(),
          );
        });
  }
}

class _WebLayout extends StatelessWidget {
  const _WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 100, bottom: 100),
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 750),
        decoration: const BoxDecoration(
          color: ColorResource.color1fabf1,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            _RightPanel(),
          ],
        ),
      ),
    );
  }

  // void listenLoginSuccess(BuildContext context) {
  //   final viewModel = context.read(loginModuleProvider);
  //   viewModel.loginSucessStream.listen((event) {
  //     if (event) {
  //       context.beamToNamed("/getFeed");
  //     }
  //   });
  // }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: ColorResource.color1fabf1),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 100),
              _RightPanel(),
            ],
          ),
        ));
  }

  // void listenLoginSuccess(BuildContext context) {
  //   final viewModel = context.read(loginModuleProvider);
  //   viewModel.loginSucessStream.listen((event) {
  //     if (event) {
  //       context.beamToNamed("/getFeed");
  //     }
  //   });
  // }
}

class _RightPanel extends StatelessWidget {
  const _RightPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(loginModuleProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            ImageResource.oncopowerLogo,
            fit: BoxFit.cover,
            height: 70,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: ColorResource.colorffffff,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: CustomText(
                    S.of(context).login,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    color: ColorResource.color1a1a1a,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  borderRadius: 8,
                  hintText: S.of(context).hintEmailId,
                  labelText: S.of(context).lableEmailId,
                  inputTextColor: ColorResource.color1a1a1a,
                  controller: viewModel.emailController,
                  onFieldSubmitted: (value) => viewModel.loginOnTap(),
                  inputFontWeight: FontWeight.normal,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25),
                AppStreamBuilder<Resource<bool>>(
                    initialData: Resource.success(data: true),
                    stream: viewModel.passwordObscured,
                    dataBuilder: (context, snapshot) {
                      return CustomTextField(
                        borderRadius: 8,
                        hintText: S.of(context).hintPassword,
                        labelText: S.of(context).lablePassword,
                        controller: viewModel.passwordController,
                        inputTextColor: ColorResource.color1a1a1a,
                        inputFontWeight: FontWeight.normal,
                        isObscure: snapshot!.data!,
                        onFieldSubmitted: (value) => viewModel.loginOnTap(),
                        suffixWidget: IconButton(
                          onPressed: () {
                            viewModel.passwordVisibleChange();
                          },
                          icon: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 10),
                              width: 15,
                              height: 12,
                              child: Image.asset(
                                viewModel.trailingImage,
                                color: ColorResource.color1a1a1a,
                              )),
                        ),
                      );
                    }),
                const SizedBox(height: 25),
                SizedBox(
                  width: 500,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      InkWell(
                          onTap: () {},
                          child: CustomText(
                            S.of(context).forgetPassword,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                            color: ColorResource.color1a1a1a,
                          )),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: S.of(context).login,
                    onPressed: () {
                      viewModel.loginOnTap();
                     
                    },
                    borderRadius: 50,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      S.of(context).haveNotAccount,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.center,
                      color: ColorResource.color1a1a1a,
                    ),
                    InkWell(
                      onTap: () {
                        context.beamToNamed("/register");
                      },
                      child: CustomText(
                        S.of(context).signUpText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        color: ColorResource.color1a1a1a,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
