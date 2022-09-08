import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rxdart/rxdart.dart';

extension SafeSubjectAddExtn<T> on Subject<T> {
  void safeAdd(T data) {
    if (!isClosed) {
      add(data);
    }
  }
}

extension GetDeviceType on BuildContext {
  bool get isMobile {
    return getDeviceType(MediaQuery.of(this).size) == DeviceScreenType.mobile;
  }

  bool get isDesktop {
    return getDeviceType(MediaQuery.of(this).size) == DeviceScreenType.desktop;
  }

  T read<T>(ProviderBase<T> provider, [bool listen = true]) {
    return ProviderScope.containerOf(this, listen: listen).read(provider);
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

extension EnumSplitExtension on Enum? {
  String get valueOfEnum => toString().split('.').last;
}
