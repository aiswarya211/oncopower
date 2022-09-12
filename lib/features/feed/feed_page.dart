import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/base/base_page.dart';
import 'package:oncopower/di/feed_modules.dart';
import 'package:oncopower/features/feed/feed_page_view.dart';
import 'package:oncopower/features/feed/feed_page_view_model.dart';

class FeedPage extends BasePage<FeedPageViewModel> {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FeedPageState();
}

class FeedPageState extends BaseStatefulPage<FeedPageViewModel, FeedPage> {
  @override
  ProviderBase provideBase() {
    return feedModuleProvider;
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  void onModelReady(FeedPageViewModel model) {
    super.onModelReady(model);
  }

  @override
  Widget buildView(BuildContext context, FeedPageViewModel model) {
    return FeedPageView(provideBase());
  }
}
