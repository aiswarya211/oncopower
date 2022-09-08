import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTransitionPage extends BeamPage {
  final Widget? childWidget;
  final String? pageTitle;
  CustomTransitionPage({
    ValueKey? key,
    @required this.childWidget,
    @required this.pageTitle,
    bool keepQueryOnPop = false,
  }) : super(key: key, child: childWidget!, keepQueryOnPop: keepQueryOnPop);

  @override
  String get title => pageTitle!;

  @override

  
 @override
  Route createRoute(BuildContext context) {
    if (kIsWeb) {
      return PageRouteBuilder(
        settings: this,
        pageBuilder: (context, animation, secondaryAnimation) => childWidget!,
      );
    }
    return MaterialPageRoute(
      settings: this,
      builder: (context) => childWidget!,
    );
  }
}