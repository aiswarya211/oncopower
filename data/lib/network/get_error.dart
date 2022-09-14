import 'dart:convert';

import 'package:data/entity/error_response/error_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/network_error.dart';

NetworkError getError({Response? apiResponse}) {
  if (apiResponse?.data != null) {

    try {
      final ErrorResponseEntity errorResponseEntity =
          ErrorResponseEntity.fromJson((apiResponse?.data) is String
              ? jsonDecode(apiResponse?.data)
              : apiResponse?.data as Map<String, dynamic>);
            
      return NetworkError(
          httpError: apiResponse!.statusCode.toString(),
          errorCode: errorResponseEntity.message!,
          description: errorResponseEntity.code.toString(),
          cause: Exception("Server Response Error"));
    } catch (exception) {
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse!.statusCode.toString(),
          message: apiResponse.statusMessage);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse!.statusCode.toString(),
        message: apiResponse.statusMessage!);
  }
}
