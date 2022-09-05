import 'package:data/di/repository_modules.dart';
import 'package:domain/usecase/login/login_usecase.dart';
import 'package:riverpod/riverpod.dart';

final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
  (ref) => LoginUseCase(ref.read(loginRepoProvider)),
);