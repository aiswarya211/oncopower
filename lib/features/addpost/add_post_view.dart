import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/base/base_page.dart';
import 'package:oncopower/di/add_post_modules.dart';

import 'package:oncopower/features/addpost/add_post_page_view.dart';
import 'package:oncopower/features/addpost/add_post_page_view_model.dart';

class AddPostPage extends BasePage<AddPostPageViewModel> {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddPostPageState();
}

class AddPostPageState extends BaseStatefulPage<AddPostPageViewModel, AddPostPage> {
  @override
  ProviderBase provideBase() {
    return addPostModuleProvider;
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  void onModelReady(AddPostPageViewModel model) {
    super.onModelReady(model);
  }

  @override
  Widget buildView(BuildContext context, AddPostPageViewModel model) {
    return AddPostPageView(provideBase());
  }
}