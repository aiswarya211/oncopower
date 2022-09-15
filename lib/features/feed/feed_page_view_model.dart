import 'package:data/entity/feed/feed_data_entity.dart';
import 'package:domain/model/post/feed_post.dart';
import 'package:domain/usecase/feed/feed_usecase.dart';
import 'package:domain/usecase/feed/like_usecase.dart';
import 'package:oncopower/base/base_page_view_model.dart';
import 'package:oncopower/utils/app_subject.dart';
import 'package:oncopower/utils/request_manager.dart';
import 'package:oncopower/utils/resource.dart';
import 'package:oncopower/utils/status.dart';

class FeedPageViewModel extends BasePageViewModel with FeedViewModelStreams {
  Stream<Resource<FeedList>> get getFeed => _getFeedResponse.stream;

  final FeedUseCase _feedUseCase;

  final LikeUseCase _likeUseCase;

  bool isLoading = false;
  int currentPage = 1;
  int? lastPage;
  bool isLastPage = false;
  List<FeedPost> feedPost = [];

  Stream<Resource<FeedData>> get getFeedListResponseStream =>
      _getAllFeedListResponse.stream;

  Stream<bool> get feedSucessStream => _feedSucess.stream;

  FeedPageViewModel(
    this._feedUseCase,
    this._likeUseCase,
  ) {
    initial();
    tiggerGetFeedList();
    listenLikeResponse();
  }

  void initial() {
    _getFeedRequest.listen(
      (value) {
        RequestManager(value,
                createCall: () => _feedUseCase.execute(params: value))
            .asFlow()
            .listen(
          (event) async {
            updateLoader();
            if (event.status == Status.error) {
              showToastWithError(event.appError!);
              showErrorState();
            }

            if (event.status == Status.success) {
              feedPost.addAll(event.data!.feed!.feedList
                  .map((e) => e.feedPostEntity!.transform())
                  .toList());

              _getAllFeedListResponse
                  .add(Resource.success(data: event.data!.feed));
            }
          },
        );
      },
    );
  }

  void tiggerGetFeedList() {
    feedPost.clear();
    _getFeedRequest.add(GetFeedUseCaseParams());
  }

  void tiggerLikeRequest(FeedPost feedPost) {
    _getLikeRequest.add(
      LikeUseCaseParams(feedPost.islike!, feedPost.likeCount!, feedPost.id!),
    );
  }

  void listenLikeResponse() {
    _getLikeRequest.listen((value) {
      RequestManager(value,
              createCall: () => _likeUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        updateLoader();
        if (event.status == Status.error) {
          showToastWithError(event.appError!);
          showErrorState();
        }

        if (event.status == Status.success) {
          showSuccessToast(event.data!.message!);
          tiggerGetFeedList();
          _likeResponse.add(Resource.success(data: true));
        }
      });
    });
  }
}

mixin FeedViewModelStreams {
  // Request Streams
  final _getFeedRequest = AppStream<GetFeedUseCaseParams>();
  final _getLikeRequest = AppStream<LikeUseCaseParams>();

  // Response Streams
  final _getFeedResponse = AppStream<Resource<FeedList>>(preserveState: true);

  final _likeResponse = AppStream<Resource<bool>>(
    preserveState: true,
  );

  final _getAllFeedListResponse =
      AppStream<Resource<FeedData>>(preserveState: true);

  final _feedSucess = AppStream<bool>(initialValue: false);
}
