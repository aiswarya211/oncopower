import 'package:domain/constant/domain_enums.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/error_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:oncopower/base/base_page_view_model.dart';
import 'package:oncopower/base/base_widget.dart';
import 'package:oncopower/generated/l10n.dart';
import 'package:oncopower/molecules/app_progress.dart';
import 'package:oncopower/parser/error_parser.dart';
import 'package:oncopower/utils/base_page_extension.dart';

abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
    T extends BasePage<VM>> extends State<T> {}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool subscribeVisibilityEvents = false;

  BaseStatefulPage({
    this.subscribeVisibilityEvents = false,
  });

  VM? _viewModel;

  bool get attached => _viewModel != null;

  /// Called when the widget becomes visible or enters foreground while visible.
  ///
  void onFocusGained() {}

  /// Called when the widget becomes invisible or enters background while visible.
  void onFocusLost() {}

  /// Called when the widget becomes visible.
  void onVisibilityGained() {}

  /// Called when the widget becomes invisible.
  void onVisibilityLost() {}

  /// Called when the app entered the foreground while the widget is visible.
  void onForegroundGained() {}

  /// Called when the app is sent to background while the widget was visible.
  void onForegroundLost() {}

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return stateBuild(context);
  }

  Widget stateBuild(BuildContext context) {
    return subscribeVisibilityEvents
        ? FocusDetector(
            onFocusLost: () => onFocusLost(),
            onFocusGained: () => onFocusGained(),
            onVisibilityLost: () => onVisibilityLost(),
            onVisibilityGained: () => onVisibilityGained(),
            onForegroundLost: () => onForegroundLost(),
            onForegroundGained: () => onForegroundGained(),
            child: _getLayout(),
          )
        : _getLayout();
  }

  /// Returns viewModel of the screen
  VM getViewModel() {
    return attached
        ? _viewModel!
        : throw AppError(
            cause: Exception("View model is not attached"),
            error: ErrorInfo(message: "View Model is not attached"),
            type: ErrorType.ui,
          );
  }

  /// Actual Screen which load scaffold and load UI
  Widget _getLayout() {
    return BaseWidget<VM>(
        providerBase: provideBase(),
        onModelReady: _onBaseModelReady,
        builder: (BuildContext context, VM? model, Widget? child) {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: scaffoldBackgroundColor(),
            appBar: buildAppbar(),
            floatingActionButton: buildFloatingActionButton(context),
            extendBodyBehindAppBar: extendBodyBehindAppBar(),
            body: _buildScaffoldBody(context, model!),
            drawer: buildDrawer(),
            drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
            bottomNavigationBar: buildBottomNavigationBar(),
            bottomSheet: buildBottomSheet(),
          );
        });
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// bottom inset
  bool? resizeToAvoidBottomInset() {
    return false;
  }

  /// Building a appbar of screen
  Color? scaffoldBackgroundColor() {
    return null;
  }

  /// Building a drawer of screen
  Widget? buildDrawer() {
    return null;
  }

  /// Building a bottom-sheet
  Widget? buildBottomSheet() {
    return null;
  }

  Widget? buildFloatingActionButton(BuildContext context) {
    return null;
  }

  /// Building a bottomNaviagtion Bar
  Widget? buildBottomNavigationBar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool drawerEnableOpenDragGesture() {
    return false;
  }

  Widget _buildScaffoldBody(BuildContext context, VM model) {
    return buildView(context, model);
  }

  @mustCallSuper
  Widget buildView(BuildContext context, VM model);

  void _onBaseModelReady(VM model) {
    _viewModel = model;
    model.error.listen((event) {
      if (mounted) {
        showErrorMessage(ErrorParser.getLocalisedStringError(
          error: event,
          localisedHelper: S.of(context),
        ));
      }
    });
    model.toast.listen((message) {
      showShortToast(message);
    });
    model.successStream.listen((event) {
      showSuccessMessage(event);
    });
    model.loadingStream.listen((value) {
      if (mounted) {
        if (value) {
          AppProgress(context);
        } else {
          Navigator.pop(context);
        }
      }
    });
    onModelReady(model);
  }

  Future<bool> onBackPressed({dynamic param}) {
    return _onWillPop(param);
  }

  Future<bool> _onWillPop(dynamic param) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
        return Future.value(false);
      } else {
        Navigator.pop(
          context,
        );
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  /*Mandatory*/

  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}

  /// Declare and initialization of viewModel for the page
  ProviderBase provideBase();
}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase providerBase;

  const BasePageViewWidget(this.providerBase, {Key? key}) : super(key: key);

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() =>
      DataProviderElement<T>(this, providerBase);
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase providerBase;

  DataProviderElement(BasePageViewWidget widget, this.providerBase)
      : super(widget);

  @override
  BasePageViewWidget get widget => super.widget as BasePageViewWidget;

  @override
  Widget build() {
    return BaseWidget<T>(
      providerBase: providerBase,
      builder: (context, model, child) {
        return widget.build(this, model!);
      },
    );
  }
}
