

import 'package:domain/di/feed_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/features/feed/feed_page_view_model.dart';

final feedModuleProvider =
    ChangeNotifierProvider.autoDispose<FeedPageViewModel>((ref) {
  return FeedPageViewModel(
      ref.read(feedUseCaseProvider));
});