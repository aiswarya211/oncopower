import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/base/base_page.dart';

import 'package:oncopower/di/add_post_modules.dart';
import 'package:oncopower/features/addpost/add_post_page_view_model.dart';
import 'package:oncopower/generated/l10n.dart';
import 'package:oncopower/molecules/custom_button.dart';
import 'package:oncopower/molecules/custom_text.dart';
import 'package:oncopower/molecules/custom_textformfield.dart';
import 'package:oncopower/utils/color_resources.dart';

import 'package:oncopower/utils/custom_scaffold.dart';
import 'package:oncopower/utils/extensions.dart';
import 'package:oncopower/utils/image_resources.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddPostPageView extends BasePageViewWidget<AddPostPageViewModel> {
  const AddPostPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);
  @override
  Widget build(BuildContext context, AddPostPageViewModel model) {
    return CustomScaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          elevation: 0,
          toolbarHeight: 90,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              context.beamToNamed("/feed");
            },
            icon: Image(
              image: AssetImage(ImageResource.cancelImage),
              color: context.isDesktop
                  ? ColorResource.color1a1a1a
                  : ColorResource.colorffffff,
            ),
          ),
          actions: const [_AddPostAppBar()],
          backgroundColor: context.isDesktop
              ? ColorResource.colorffffff
              : ColorResource.color1fabf1,
          centerTitle: true,
        ),
      ),
      body: ScreenTypeLayout.builder(
        desktop: (BuildContext context) => const _WebLayout(),
        mobile: (BuildContext context) => const _MobileLayout(),
        tablet: (BuildContext context) => const _MobileLayout(),
      ),
    );
  }
}

class _WebLayout extends StatelessWidget {
  const _WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: ColorResource.colorffffff,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [_AddPostPiceker()],
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: ColorResource.colorffffff),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [_AddPostPiceker()],
        ),
      ),
    );
  }
}

class _AddPostAppBar extends StatelessWidget {
  const _AddPostAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(addPostModuleProvider);
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: context.isDesktop
                ? const EdgeInsets.only(left: 500)
                : const EdgeInsets.only(
                    right: 60,
                    top: 40,
                    left: 40,
                    bottom: 10,
                  ),
            child: Container(
              alignment: Alignment.center,
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(ImageResource.profileImage),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: context.isDesktop
                ? const EdgeInsets.only(left: 800)
                : const EdgeInsets.only(bottom: 10,top: 40,),
            child: Container(
              alignment: Alignment.centerLeft,
              child: CustomTextButton(
                onPressed: (() {
                  viewModel.triggerSharePost();
                  // context.beamToNamed("/feed");
                }),
                child: CustomText(
                  color: context.isDesktop
                      ? ColorResource.color1a1a1a
                      : ColorResource.colorffffff,
                  S.of(context).addPostText,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddPostPiceker extends StatelessWidget {
  const _AddPostPiceker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(addPostModuleProvider);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              alignment: Alignment.bottomLeft,
              child: CustomTextField(
                hintText: S.of(context).addPostHintText,
                inputTextColor: ColorResource.color1a1a1a,
                controller: viewModel.descriptionController,
                onFieldSubmitted: (value) => viewModel.triggerSharePost(),
                inputFontWeight: FontWeight.normal,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
