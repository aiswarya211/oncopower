
import 'package:data/entity/feed/feed_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/base/base_page.dart';
import 'package:oncopower/di/feed_modules.dart';
import 'package:oncopower/features/feed/feed_page_view_model.dart';

import 'package:oncopower/molecules/app_stream_builder.dart';
import 'package:oncopower/utils/color_resources.dart';
import 'package:oncopower/utils/extensions.dart';
import 'package:oncopower/utils/resource.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FeedPageView extends BasePageViewWidget<FeedPageViewModel> {
  const FeedPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);
  @override
  Widget build(BuildContext context, FeedPageViewModel model) {
    return AppStreamBuilder<Resource<FeedList>>(
        stream: model.getFeed,
        initialData: Resource.none(),
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
          padding: const EdgeInsets.only(bottom: 50, top: 100),
          constraints: const BoxConstraints(
              maxWidth: 500, maxHeight: 850, minHeight: 300),
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
    final viewModel = context.read(feedModuleProvider);
    // viewModel.registerSucessStream.listen((event) {
    //   if (event) {
    //     context.beamToNamed("/login");
    //   }
    // });
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
    final viewModel = context.read(feedModuleProvider);
    // viewModel.registerSucessStream.listen((event) {
    //   if (event) {
    //     context.beamToNamed("/login");
    //   }
    // });
  }
}

class _RightPanel extends StatelessWidget {
  const _RightPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
