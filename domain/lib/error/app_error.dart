
import 'package:domain/constant/domain_enums.dart';
import 'package:domain/model/error_info.dart';

class AppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception cause;

  AppError({
    required this.cause,
    required this.error,
    required this.type,
  });
}