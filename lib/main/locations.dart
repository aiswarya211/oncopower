import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:oncopower/di/app_modules.dart';
import 'package:oncopower/features/login_page.dart';
import 'package:oncopower/main/custom_transition_page.dart';
import 'package:oncopower/molecules/custom_text.dart';
import 'package:oncopower/utils/enums.dart';
import 'package:oncopower/utils/extensions.dart';
import 'package:oncopower/utils/image_resources.dart';

class BeamerRoutes {
  static final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(beamLocations: [
      LoginLocation(),
      
    ]),
    initialPath: "/login",
    notFoundPage: notFoundPage,
    guards: [
      BeamGuard(
        pathPatterns: ["/login"],
        guardNonMatching: true,
        beamToNamed: (c, a) => "/login",
        check: (context, location) {
          final viewModel = context.read(appViewModelProvider);
          return viewModel.authState != AuthenticationStatus.unAuthenticated;
        },
      ),
      BeamGuard(
        pathPatterns: ["/login"],
        onCheckFailed: (context, location) {
         
        },
        check: (context, location) {
          final viewModel = context.read(appViewModelProvider);
          return viewModel.authState != AuthenticationStatus.authenticated;
        },
      ),
    ],
  );
}

final notFoundPage = CustomTransitionPage(
  childWidget: routeNotFound(),
  pageTitle: "404 Not Found",
);

Widget routeNotFound() {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            width: 350,
            child: Image.asset(
              ImageResource.onRoutesFound,
            ),
          ),
          const CustomText(
            "404 Not Found",
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    ),
  );
}

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      CustomTransitionPage(
        key: const ValueKey("Login"),
        childWidget: const LoginPage(),
        pageTitle: "Login",
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ["/login"];
}
