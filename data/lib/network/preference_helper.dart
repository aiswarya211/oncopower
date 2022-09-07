import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:data/entity/login/user_entity.dart';
import 'package:domain/error/local_error.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static Future<Either<LocalError, bool>> saveToken(String? token) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      if (token == null) return const Right(false);
      final value = await pref.setString("token", token);
      return Right(value);
    } catch (e) {
      return Left(
          LocalError(cause: e as Exception, databaseError: "", message: ""));
    }
  }

  static Future clearStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<Either<LocalError, String?>> getToken() async {
    try {
      String? value;
      final SharedPreferences pref = await SharedPreferences.getInstance();
      value = pref.getString("token");
      if (value?.isEmpty ?? true) {
        return const Right(null);
      } else {
        return Right(value);
      }
    } catch (e) {
      return Left(
          LocalError(cause: e as Exception, databaseError: "", message: ""));
    }
  }

  static Future<Either<LocalError, UserEntity?>> getUser() async {
    try {
      String? value;
      final SharedPreferences pref = await SharedPreferences.getInstance();
      value = pref.getString("user");

      if (value?.isEmpty ?? true) {
        return const Right(null);
      } else {
        final Map<String, dynamic> map = await _parseJson(value);
        return Right(UserEntity.fromJson(map));
      }
    } catch (e) {
      return Left(
          LocalError(cause: e as Exception, databaseError: "", message: ""));
    }
  }

  static Future<Either<LocalError, bool>> saveUser(UserEntity? user) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (user == null) return const Right(false);

      final value = await prefs.setString("user", json.encode(user));
      return Right(value);
    } catch (e) {
      return Left(
          LocalError(cause: e as Exception, databaseError: "", message: ""));
    }
  }

  static Map<String, dynamic> _parseAndDecode(String response) {
    return jsonDecode(response) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> _parseJson(String? text) {
    return compute(_parseAndDecode, text!);
  }
}
