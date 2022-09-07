
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oncopower/utils/color_resources.dart';

class AppProgress {
  AppProgress(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        barrierColor: ColorResource.color1a1a1a.withOpacity(0.7),
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
                child: SizedBox(
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.blue,
                size: 50,
                secondRingColor: ColorResource.color1fabf1,
                
              ),
            )),
          );
        });
  }
}