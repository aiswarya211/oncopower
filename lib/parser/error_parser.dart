import 'package:domain/constant/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:oncopower/generated/l10n.dart';

class ErrorParser {
  ErrorParser._();

  static String getLocalisedStringError(
      {AppError? error, required S localisedHelper}) {
    switch (error?.type) {
      case ErrorType.ioException:
        return localisedHelper.genericError;
      case ErrorType.ui:
        return error!.error.message;
      case ErrorType.network:
        return error!.error.message;
      case ErrorType.emptyPassword:
        return localisedHelper.enterPassword;
      case ErrorType.emptyEmail:
        return localisedHelper.emptyEmailMessage;
      case ErrorType.invaildEmail:
        return localisedHelper.enterValidEmail;
      case ErrorType.forbidden:
        return localisedHelper.forbidden;
      case ErrorType.netNoInternetConnection:
        return localisedHelper.checkYourInternetConnection;
      case ErrorType.serverBroken:
        return localisedHelper.serverBroken;
      case ErrorType.unAuthorized:
        return localisedHelper.unauthenticated;
      case ErrorType.unProcessableEntity:
        return error!.error.message;
      case ErrorType.methodNotAllowed:
        return localisedHelper.methodNotAllowed;
      default:
        return "";
    }
  }
}
