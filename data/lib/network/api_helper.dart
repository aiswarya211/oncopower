import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data/network/network_properties.dart';
import 'package:data/network/preference_helper.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/local_error.dart';
import 'package:flutter/foundation.dart';

class ApiHelper {
  Dio dio = Dio();
  ApiHelper() {
    dio.options.baseUrl = NetworkProperties.baseUrl;
    dio.options.followRedirects = true;
    dio.options.headers[HttpHeaders.acceptHeader] = "application/json";
    dio.options.validateStatus = (status) => status! <= 400;
    dio.transformer = JsonTransformer();
    _setupAuthInterceptor();
  }

  void _setupAuthInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final Either<LocalError, String?> token =
              await PreferenceHelper.getToken();
          if (token is Right<LocalError, String?>) {
            if (token.value != null) {
              options.headers[HttpHeaders.authorizationHeader] =
                  "Bearer ${token.value}";
            }
          }
          handler.next(options);
        },
      ),
    );
  }
}

class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}

Map<String, dynamic> _parseAndDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> _parseJson(String text) {
  return compute(_parseAndDecode, text);
}
