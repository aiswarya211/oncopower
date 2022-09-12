import 'package:data/di/network_modules.dart';
import 'package:data/repository/feed_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/login_repository_impl.dart';

var loginRepoProvider = Provider<LoginRepositoryImpl>(
  (ref) => LoginRepositoryImpl(
    ref.read(loginRemoteDSProvider),
  ),
);

var feedRepoProvider = Provider<FeedRepositoryImpl>(
  (ref) => FeedRepositoryImpl(
    ref.read(feedRemoteDsProvider),
  ),
);
