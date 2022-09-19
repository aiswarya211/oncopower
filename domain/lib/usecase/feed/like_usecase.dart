import 'package:dartz/dartz.dart';
import 'package:data/entity/feed/like_response_entity.dart';
import 'package:domain/constant/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/error_info.dart';
import 'package:domain/repository/feed_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';
import 'package:domain/utils/validators.dart';

class LikeUseCase
    extends BaseUseCase<BaseError, LikeUseCaseParams, LikeResponseEntity> {
  final FeedRepository _repository;

  LikeUseCase(this._repository);

  @override
  Future<Either<BaseError, LikeResponseEntity>> execute(
      {required LikeUseCaseParams params}) async {
    return await _repository.like(
        isLike: params.isLike, count: params.count, postId: params.postId);
  }
}

class LikeUseCaseParams extends Params {
  final bool isLike;
  final int count;
  final int postId;
  LikeUseCaseParams(this.isLike, this.count, this.postId);
  @override
  Either<AppError, bool> verify() {
    ValidationState state;
    state = Validator.validate('$postId', rules: ['postId']);
    if (!state.status) {
      return Left(AppError(
          error: ErrorInfo(message: 'postId ${state.error}'),
          type: ErrorType.ui,
          cause: Exception()));
    }

    return const Right(true);
  }
}
