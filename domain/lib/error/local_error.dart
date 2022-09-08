import 'package:domain/constant/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/error_info.dart';

class LocalError extends BaseError {
  LocalError({
    required String message,
    required String databaseError,
    required Exception cause,
  }) : super(
            error: ErrorInfo(message: message, code: databaseError),
            cause: cause);

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    return AppError(error: error, cause: cause, type: ErrorType.ioException);
  }
}