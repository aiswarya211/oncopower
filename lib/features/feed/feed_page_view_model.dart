import 'package:data/entity/feed/feed_data_entity.dart';
import 'package:domain/usecase/feed/feed_usecase.dart';
import 'package:oncopower/base/base_page_view_model.dart';
import 'package:oncopower/utils/app_subject.dart';
import 'package:oncopower/utils/request_manager.dart';
import 'package:oncopower/utils/resource.dart';
import 'package:oncopower/utils/status.dart';

class FeedPageViewModel extends BasePageViewModel with FeedViewModelStreams {
  Stream<Resource<FeedList>> get getFeed => _getFeedResponse.stream;

  final FeedUseCase _feedUseCase;

  List<FeedList> feedList = [];

  Stream<bool> get feedSucessStream => _feedSucess.stream;

  FeedPageViewModel(
    this._feedUseCase,
  ) {
    initial();
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
              feedList.addAll(event.data!.feed!.feedList);
            }
          },
        );
      },
    );
  }
}

mixin FeedViewModelStreams {
  // Request Streams
  final _getFeedRequest = AppStream<GetFeedUseCaseParams>();
  // Response Streams
  final _getFeedResponse = AppStream<Resource<FeedList>>(preserveState: true);

  final _feedSucess = AppStream<bool>(initialValue: false);
}
