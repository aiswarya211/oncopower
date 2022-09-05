import 'package:beamer/beamer.dart';
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
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => childWidget!,
    );
  }
}
