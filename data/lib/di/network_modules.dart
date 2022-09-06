
import 'package:data/network/api_helper.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/login/remote/login_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<ApiHelper>(
  (ref) {
    ApiHelper dio = ApiHelper();
    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(
    ref.read(dioProvider).dio,
  ),
);

final loginRemoteDSProvider = Provider<LoginRemoteDSImpl>(
  (ref) => LoginRemoteDSImpl(
    ref.read(apiServiceProvider),
  ),
);