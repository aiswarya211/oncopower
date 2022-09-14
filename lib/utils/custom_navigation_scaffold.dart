import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oncopower/utils/custom_scaffold.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomNavigationScaffold extends StatelessWidget {
  final PreferredSize? appBar;
  final Widget? body;
  final Color color;
  final bool isBottomReSize;
  final bool fullScreen;
  final Color? statusColor;
  final bool hideNavDrawer;
  final Widget? floatingActionButton;

  final Widget? endDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final String currentRoute;

  const CustomNavigationScaffold(
      {this.appBar,
      this.body,
      this.color = Colors.white,
      this.isBottomReSize = true,
      this.floatingActionButton,
      this.fullScreen = false,
      this.statusColor,
      this.endDrawer,
      required this.currentRoute,
      this.scaffoldKey,
      this.hideNavDrawer = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusColor ?? Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness:
            statusColor == null ? Brightness.dark : Brightness.light,
      ),
      child: ScreenTypeLayout.builder(
        desktop: (BuildContext context) => layout(context),
        mobile: (BuildContext context) => mobileLayout(context),
      ),
    );
  }

  Widget mobileLayout(
    BuildContext context,
  ) {
    return CustomScaffold(
        isBottomReSize: isBottomReSize,
        color: color,
        floatingActionButton: floatingActionButton,
        appBar: appBar,
        body: _buildBody(context));
  }

  Widget layout(BuildContext context) {
    return CustomScaffold(
      globalKey: scaffoldKey,
      endDrawer: endDrawer,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: body,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (fullScreen) {
      return _buildLoader(context);
    } else {
      return SafeArea(
        child: _buildLoader(context),
      );
    }
  }

  Widget _buildLoader(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: body,
    );
  }
}
