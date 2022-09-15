import 'package:data/di/repository_modules.dart';
import 'package:domain/usecase/feed/add_post_usecase.dart';
import 'package:domain/usecase/feed/feed_usecase.dart';
import 'package:domain/usecase/feed/like_usecase.dart';
import 'package:riverpod/riverpod.dart';

final feedUseCaseProvider = Provider.autoDispose<FeedUseCase>(
  ((ref) => FeedUseCase(ref.read(feedRepoProvider))),
);

final likeUseCaseProvider = Provider.autoDispose<LikeUseCase>(
  (ref) => LikeUseCase(ref.read(feedRepoProvider)),
);

final addPostUseCaseProvider = Provider.autoDispose<AddPostUseCase>(
  (ref) => AddPostUseCase(ref.read(feedRepoProvider)),
);
