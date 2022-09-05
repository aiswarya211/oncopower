import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/base/base_widget.dart';
import 'package:oncopower/di/app_modules.dart';
import 'package:oncopower/main/app_view_model.dart';
import 'package:oncopower/main/locations.dart';

// ignore: must_be_immutable
class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);
  bool isDoneInitialized = false;
  @override
  Widget build(context, ref) {
    return BaseWidget<AppViewModel>(
      providerBase: appViewModelProvider,
      onModelReady: (model) {
        model.authStateStream.listen((event) {
          if (isDoneInitialized) {
            model.currentUser.listen((event) {
              BeamerRoutes.routerDelegate.update();
            });
          }
          isDoneInitialized = true;
        });
        // // eventBus.on<UnAuthenticatedEvent>().listen((event) {
        // //   model.logout();
        // });
      },
      builder: (context, appModel, child) {
        return MaterialApp.router(
          routerDelegate: BeamerRoutes.routerDelegate,
          title: "Oncopower",
          theme: ThemeData(primaryColor: Colors.white),
          debugShowCheckedModeBanner: false,
          routeInformationParser: BeamerParser(),
          localizationsDelegates: const [
            // S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          // supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),
          backButtonDispatcher:
              BeamerBackButtonDispatcher(delegate: BeamerRoutes.routerDelegate),
        );
      },
    );
  }
}
