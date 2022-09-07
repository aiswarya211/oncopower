import 'package:domain/constant/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/error_model.dart';

class NetworkError extends BaseError {
  NetworkError(
      {required String httpError,
      String errorCode = "",
      String? message = "",
      required Exception cause,
      String description = ""})
      : super(
            error: ErrorInfo(
                code: httpError, message: errorCode, description: description),
            cause: cause);

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case "500":
        return AppError(
            error: error, cause: cause, type: ErrorType.serverBroken);

      case "403":
        return AppError(cause: cause, error: error, type: ErrorType.forbidden);

      case "401":
        // eventBus.fire(UnAuthenticatedEvent());
        return AppError(
            cause: cause, error: error, type: ErrorType.unAuthorized);

      case "404":
        return AppError(cause: cause, error: error, type: ErrorType.forbidden);

      case "405":
        return AppError(
            cause: cause, error: error, type: ErrorType.methodNotAllowed);
      case "422":
      return AppError(cause: cause, error: error, type: ErrorType.ioException);
      case "429":
        return AppError(
            cause: cause, error: error, type: ErrorType.tooManyRequest);

      case "err-001":
        return AppError(
            cause: cause, error: error, type: ErrorType.invaildEmail);

      case "err-002":
        return AppError(
            cause: cause, error: error, type: ErrorType.invaildPassword);

      default:
        return AppError(cause: cause, error: error, type: ErrorType.network);
    }
  }
}


