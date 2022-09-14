import 'package:dartz/dartz.dart';
import 'package:data/entity/login/user_entity.dart';
import 'package:data/network/preference_helper.dart';
import 'package:domain/error/local_error.dart';
import 'package:oncopower/base/base_view_model.dart';
import 'package:oncopower/utils/app_subject.dart';
import 'package:oncopower/utils/enums.dart';
import 'package:oncopower/utils/resource.dart';

class AppViewModel extends BaseViewModel with AppViewModelStreams {
  Stream<AuthenticationStatus> get authStateStream => _authStateResponse.stream;

  AuthenticationStatus get authState => _authStateResponse.value!;

  Stream<String> get appVersion => _appVersionResponse.stream;

  Stream<String> get currentToken => _currentTokenResponse.stream;

  Stream<Resource<UserEntity>> get currentUser =>
      _currentUserResponse.stream;


  UserEntity? get currentUserValue => _currentUserResponse.value?.data;

  AppViewModel() {
    // listenAppVersionRequest();
    listenAuthStateRequest();
    listenCurrentTokenRequest();
    listenCurrentUserRequest();
    getPackageInfo();
    login();
  }
  // void listenAppVersionRequest() {
  //   _appVersionRequest.listen((value) async {
  //     if (value) {
  //       PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //       _appVersionResponse.add(packageInfo.version);
  //     }
  //   });
  // }

  void listenAuthStateRequest() {
    _authStateRequest.listen((value) {
      _authStateResponse.add(value);
    });
  }

  void listenCurrentTokenRequest() {
    _currentTokenRequest.listen((value) async {
      if (value) {
        final token = await PreferenceHelper.getToken();
        if (token is Right<LocalError, String?>) {
          if (token.value != null) {
            _currentTokenResponse.add(token.value!);
          }
        }
      }
    });
  }

  void listenCurrentUserRequest() {
    _currentUserRequest.listen((value) async {
      if (value) {
        final user = await PreferenceHelper.getUser();
        if (user is Right<LocalError, UserEntity?>) {
          if (user.value != null) {
            _currentUserResponse.add(Resource.success(data: user.value!));
          }
        }
      }
    });
  }

  void getPackageInfo() {
    _appVersionRequest.add(true);
  }

  void getCurrentToken() {
    _currentTokenRequest.add(true);
  }

  void getCurrentUser() {
    _currentUserRequest.add(true);
  }

  Future<void> login() async {
    final token = await PreferenceHelper.getToken();

    if (token is Right<LocalError, String?>) {
      if (token.value != null) {
        getCurrentToken();
        getCurrentUser();
        _authStateRequest.add(AuthenticationStatus.authenticated);
      } else {
        _authStateRequest.add(AuthenticationStatus.unAuthenticated);
      }
    } else {
      _authStateRequest.add(AuthenticationStatus.unAuthenticated);
    }
  }

  Future<void> logout() async {
    await PreferenceHelper.clearStorage();
    _authStateRequest.add(AuthenticationStatus.unAuthenticated);
  }

  void changeAuthStatus(AuthenticationStatus authenticationStatus) {
    _authStateRequest.add(authenticationStatus);
  }
}

mixin AppViewModelStreams {
  final _appVersionRequest = AppStream<bool>();
  final _currentTokenRequest = AppStream<bool>();
  final _currentUserRequest = AppStream<bool>();

  final _authStateResponse = AppStream<AuthenticationStatus>(
      preserveState: false, initialValue: AuthenticationStatus.unAuthenticated);

  final _authStateRequest = AppStream<AuthenticationStatus>();

  final _appVersionResponse = AppStream<String>(preserveState: true);
  final _currentTokenResponse = AppStream<String>(preserveState: true);
  final _currentUserResponse =
      AppStream<Resource<UserEntity>>(preserveState: true);
}
