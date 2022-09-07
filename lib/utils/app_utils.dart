import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppUtils {
  AppUtils._();

  /// Showing toast message
  static void showToast(String? text,
      {Color color = Colors.green,
      ToastGravity? toastGravity,
      String? webColor}) {
    if (text == null) return;
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color,
        // textColor: Colors.white,
        webBgColor: webColor,
        webShowClose: true,
        timeInSecForIosWeb: 3,
        webPosition: "center",
        fontSize: 14.0);
  }

  ////Copy text to clipboard
  static void copyToClipBoard(String? text) {
    Clipboard.setData(ClipboardData(text: text ?? ""));
    AppUtils.showToast("Copied to Clipboard");
  }

  /// Generate a random string
  static String getRandomString({int length = 15}) {
    final Random rand = Random();
    final List<int> codeUnits = List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });

    return String.fromCharCodes(codeUnits);
  }

  ///Used to hide keyboard
  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  ///Return true if keyboard is visible
  static bool isKeyBoardVisible(BuildContext context) {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  /// generates a random int
  static int generateRandomNumber(Map<String, dynamic> message) {
    final Random rng = Random();
    return rng.nextInt(100);
  }

  ///Remove all HTML Tags
  static String removeAllHtmlTags(String htmlText) {
    final RegExp exp = RegExp("<[^>]*>", multiLine: true);
    return htmlText.replaceAll(exp, '');
  }

  static bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get capitalizeFirstofEach => split(" ")
      .map((str) => str[0].toUpperCase() + str.substring(1).toLowerCase())
      .join(" ");
  String get removeUnderScore => split("_")
      .map((str) => str[0].toUpperCase() + str.substring(1).toLowerCase())
      .join(" ");
}

extension TextEditingControllerExtensions on TextEditingController {
  void safeClear() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      clear();
    });
  }
}

extension Ex on double {
  double convertDigit(int n) => double.parse(toStringAsFixed(n));
}

extension GetDeviceType on BuildContext {
  bool get isMobile {
    return getDeviceType(MediaQuery.of(this).size) == DeviceScreenType.mobile ||
        getDeviceType(MediaQuery.of(this).size) == DeviceScreenType.tablet;
  }

  bool get isDesktop {
    return getDeviceType(MediaQuery.of(this).size) == DeviceScreenType.desktop;
  }
}

extension EnumSplitExtension on Enum? {
  String get valueOfEnum => toString().split('.').last;
}