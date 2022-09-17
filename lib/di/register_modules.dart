import 'package:domain/di/login_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/features/register/register_page_view_model.dart';

final registerModuleProvider =
    ChangeNotifierProvider.autoDispose<RegisterPageViewModel>((ref) {
  return RegisterPageViewModel(ref.read(registerUseCaseProvider));
});
