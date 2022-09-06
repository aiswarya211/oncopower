import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data/network/get_error.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/network_error.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>?> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    switch (throwable.runtimeType) {
      case DioError:
        switch ((throwable as DioError).type) {
          case DioErrorType.connectTimeout:
            break;
          case DioErrorType.sendTimeout:
            break;
          case DioErrorType.receiveTimeout:
            break;
          case DioErrorType.response:
            return Left(getError(apiResponse: throwable.response));
          case DioErrorType.cancel:
            break;
          case DioErrorType.other:
            return Left(
              NetworkError(
                  message:
                      "Connection to API server failed due to internet connection",
                  httpError: "503",
                  cause: throwable),
            );
        }

        break;

      case IOException:
        return Left(NetworkError(
            message: throwable.toString(), httpError: "502", cause: throwable));

      default:
        return Left(NetworkError(
            message: throwable.toString(), httpError: "502", cause: throwable));
    }
  }
  return null;
}

extension RetrofitResponse on HttpResponse {

  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
}
