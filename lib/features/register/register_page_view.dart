import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/di/app_modules.dart';

import 'package:oncopower/di/register_modules.dart';
import 'package:oncopower/features/register/register_page_view_model.dart';

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

import '../../base/base_page.dart';

class RegisterPageView extends BasePageViewWidget<RegisterPageViewModel> {
  const RegisterPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);
  @override
  Widget build(BuildContext context, RegisterPageViewModel model) {
    return AppStreamBuilder<Resource<bool>>(
        stream: model.isLoggedIn,
        initialData: Resource.success(data: false),
        dataBuilder: (context, snapshot) {
          // if (snapshot!.status == Status.success && snapshot.data!) {
          //   context.read(appViewModelProvider).();
          // }
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
    listenRegisterSuccess(context);
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 100),
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 900),
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
      ),
    );
  }

  void listenRegisterSuccess(BuildContext context) {
    final viewModel = context.read(registerModuleProvider);
    viewModel.registerSucessStream.listen((event) {
      if (event) {
        context.beamToNamed("/login");
      }
    });
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listenRegisterSuccess(context);
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

  void listenRegisterSuccess(BuildContext context) {
    final viewModel = context.read(registerModuleProvider);
    viewModel.registerSucessStream.listen((event) {
      if (event) {
        context.beamToNamed("/login");
      }
    });
  }
}

class _RightPanel extends StatelessWidget {
  const _RightPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(registerModuleProvider);
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
                    S.of(context).signUpText,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    color: ColorResource.color1a1a1a,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  borderRadius: 8,
                  hintText: S.of(context).firstNameText,
                  labelText: S.of(context).firstNameText,
                  inputTextColor: ColorResource.color1a1a1a,
                  controller: viewModel.emailController,
                  onFieldSubmitted: (value) => viewModel.signUpOnTap(),
                  inputFontWeight: FontWeight.normal,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  borderRadius: 8,
                  hintText: S.of(context).lastNameText,
                  labelText: S.of(context).lastNameText,
                  inputTextColor: ColorResource.color1a1a1a,
                  controller: viewModel.emailController,
                  onFieldSubmitted: (value) => viewModel.signUpOnTap(),
                  inputFontWeight: FontWeight.normal,
                  keyboardType: TextInputType.emailAddress,
                ),
                 const SizedBox(height: 25),
                CustomTextField(
                  borderRadius: 8,
                  hintText: S.of(context).emailAddresshintText,
                  labelText: S.of(context).emailAddresslabelText,
                  inputTextColor: ColorResource.color1a1a1a,
                  controller: viewModel.emailController,
                  onFieldSubmitted: (value) => viewModel.signUpOnTap(),
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
                        hintText: S.of(context).passwordhintText,
                        labelText: S.of(context).passwordLabelText,
                        controller: viewModel.passwordController,
                        inputTextColor: ColorResource.color1a1a1a,
                        inputFontWeight: FontWeight.normal,
                        isObscure: snapshot!.data!,
                        onFieldSubmitted: (value) => viewModel.signUpOnTap(),
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
                Container(
                  alignment: Alignment.center,
                  child: CustomText(
                    S.of(context).AcceptTermsAndCondition,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    color: const Color(0xff232222),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: S.of(context).signUpText,
                    onPressed: viewModel.signUpOnTap,
                    borderRadius: 50,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      S.of(context).alreadyHaveAccText,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.center,
                      color: ColorResource.color1a1a1a,
                    ),
                    InkWell(
                      onTap: () {
                        context.beamToNamed("/login");
                      },
                      child: CustomText(
                        S.of(context).login,
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