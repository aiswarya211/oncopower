import 'package:data/di/network_modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/base/base_page.dart';
import 'package:oncopower/di/app_modules.dart';
import 'package:oncopower/features/login_page_view_model.dart';
import 'package:oncopower/molecules/app_stream_builder.dart';
import 'package:oncopower/utils/color_resources.dart';
import 'package:oncopower/utils/extensions.dart';
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
            
            mobile: (BuildContext context) => const _MobileLayout(),
          );
        });
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       
    );
  }
}
