import 'package:domain/di/feed_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/features/addpost/add_post_page_view_model.dart';

final addPostModuleProvider =
    ChangeNotifierProvider.autoDispose<AddPostPageViewModel>((ref) {
  return AddPostPageViewModel(
      ref.read(addPostUseCaseProvider),);
});