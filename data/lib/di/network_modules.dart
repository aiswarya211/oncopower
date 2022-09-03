
import 'package:data/network/api_helper.dart';
import 'package:data/network/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<DioHelper>(
  (ref) {
    DioHelper dio = DioHelper();
    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(
    ref.read(dioProvider).dio,
  ),
);