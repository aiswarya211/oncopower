import 'package:domain/di/login_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/features/login/login_page_view_model.dart';

final loginModuleProvider =
    ChangeNotifierProvider.autoDispose<LoginPageViewModel>((ref) {
  return LoginPageViewModel(
      ref.read(loginUseCaseProvider));
});