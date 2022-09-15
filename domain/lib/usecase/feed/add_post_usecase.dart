import 'package:dartz/dartz.dart';
import 'package:data/entity/feed/add_post_response_entity.dart';
import 'package:domain/constant/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/error_info.dart';
import 'package:domain/repository/feed_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';
import 'package:domain/utils/validators.dart';

class AddPostUseCase
    extends BaseUseCase<BaseError, AddPostCaseParams, AddPostResponseEntity> {
  final FeedRepository _repository;

  AddPostUseCase(this._repository);

  @override
  Future<Either<BaseError, AddPostResponseEntity>> execute(
      {required AddPostCaseParams params}) async {
    return await _repository.addPost(
      description: params.description,
      visibility: params.visibility,
    );
  }
}

class AddPostCaseParams extends Params {
  final String description;
  final int visibility;

  AddPostCaseParams(
    this.description,
    this.visibility,
  );
  @override
  Either<AppError, bool> verify() {
    ValidationState state;
    state = Validator.validate(description, rules: ['description']);
    if (!state.status) {
      return Left(AppError(
          error: ErrorInfo(message: 'description ${state.error}'),
          type: ErrorType.ui,
          cause: Exception()));
    }

    return const Right(true);
  }
}
