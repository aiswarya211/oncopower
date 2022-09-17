
import 'package:domain/usecase/feed/add_post_usecase.dart';
import 'package:flutter/material.dart';
import 'package:oncopower/base/base_page_view_model.dart';
import 'package:oncopower/utils/app_subject.dart';
import 'package:oncopower/utils/request_manager.dart';
import 'package:oncopower/utils/resource.dart';
import 'package:oncopower/utils/status.dart';

class AddPostPageViewModel extends BasePageViewModel
    with AddPostViewModelStreams {
  final AddPostUseCase _addPostUseCase;
  Stream<bool> get addPostSucessStream => _addPostSucess.stream;
  TextEditingController descriptionController = TextEditingController();
  final visibility = 1;

  AddPostPageViewModel(
    this._addPostUseCase,
  ) {
    listenAddPostResponse();
  }

  void listenAddPostResponse() {
    _getAddPostRequest.listen(
      (value) {
        RequestManager(value,
                createCall: () => _addPostUseCase.execute(params: value))
            .asFlow()
            .listen(
          (event) async {
            updateLoader();
            if (event.status == Status.error) {
              showToastWithError(event.appError!);
              showErrorState();
            }

            if (event.status == Status.success) {
               showSuccessToast(event.data!.message!);
              _addPostResponse.add(Resource.success(data: true));
              descriptionController.clear();
            }
          },
        );
      },
    );
  }

  void triggerSharePost() {
    _getAddPostRequest
        .add((AddPostCaseParams(descriptionController.text, visibility)));
  }
}

mixin AddPostViewModelStreams {
  // Request Streams
  final _getAddPostRequest = AppStream<AddPostCaseParams>();

  // Response Streams
  final _addPostResponse = AppStream<Resource<bool>>(
      preserveState: true, initialValue: Resource.success(data: false));

  final _addPostSucess = AppStream<bool>(initialValue: false);
}
