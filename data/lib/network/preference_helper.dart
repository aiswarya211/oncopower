import 'package:dartz/dartz.dart';
import 'package:domain/error/local_error.dart';
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
}
