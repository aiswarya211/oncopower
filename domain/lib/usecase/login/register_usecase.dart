import 'package:dartz/dartz.dart';
import 'package:data/entity/register/register_response_entity.dart';
import 'package:domain/constant/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/error_info.dart';
import 'package:domain/repository/login_repository.dart';
import 'package:domain/usecase/base/params.dart';
import 'package:domain/utils/validators.dart';

import '../../error/base_error.dart';
import '../base/base_usecase.dart';

class RegisterUseCase extends BaseUseCase<BaseError, RegisterUseCaseParams,
    RegisterResponseEntity> {
  final LoginRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<BaseError, RegisterResponseEntity>> execute(
      {required RegisterUseCaseParams params}) async {
    return await _repository.register(
        emailId: params.emailId,
        password: params.password,
        firstName: params.firstName,
        lastName: params.lastName,
        source: params.source,
        userType: params.userType);
  }
}

class RegisterUseCaseParams extends Params {
  final String emailId;
  final String firstName;
  final String lastName;
  final String password;
  final String source;
  final String userType;

  RegisterUseCaseParams(this.emailId, this.password, this.firstName,
      this.lastName, this.source, this.userType);
  @override
  Either<AppError, bool> verify() {
    ValidationState state;

    state = Validator.validate(firstName, rules: ['required']);
    if (state.status) {
      return Left(
        AppError(
          error: ErrorInfo(message: 'FirstName ${state.error}'),
          type: ErrorType.ui,
          cause: Exception(),
        ),
      );
    }

    state = Validator.validate(lastName, rules: ['required']);
    if (state.status) {
      return Left(
        AppError(
          error: ErrorInfo(message: 'LastName ${state.error}'),
          type: ErrorType.ui,
          cause: Exception(),
        ),
      );
    }
    state = Validator.validate(emailId, rules: ['required']);
    if (!state.status) {
      return Left(AppError(
          error: ErrorInfo(message: 'Email ${state.error}'),
          type: ErrorType.ui,
          cause: Exception()));
    }

    state = Validator.validate(password, rules: ['required']);
    if (!state.status) {
      return Left(AppError(
          error: ErrorInfo(message: 'Password ${state.error}'),
          type: ErrorType.ui,
          cause: Exception()));
    }

    return const Right(true);
  }
}
