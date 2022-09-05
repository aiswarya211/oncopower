
import 'package:flutter/material.dart';
import 'package:oncopower/molecules/custom_text.dart';
import 'package:oncopower/utils/color_resources.dart';
import 'package:oncopower/utils/font.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backGroundColor;
  final String font;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final Color? borderColor;
  final Function()? onPressed;
  final Color fontColor;
  final Widget? icon;
  final Color? splashColor;
  final Gradient? gradient;
  final double horizontalPadding;
  final double verticalPadding;

  const CustomButton(
      {required this.text,
      this.backGroundColor = ColorResource.darkBlack,
      this.font = Font.quicksand,
      this.fontSize = 16,
      this.borderRadius = 20,
      required this.onPressed,
      this.fontColor = ColorResource.white,
      this.horizontalPadding = 8,
      this.verticalPadding = 8,
      this.borderColor,
      this.icon,
      this.splashColor,
      this.gradient,
      this.fontWeight = FontWeight.w400,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        color: backGroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: splashColor,
          shape: RoundedRectangleBorder(
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
          primary: gradient != null ? Colors.transparent : backGroundColor,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: icon,
                ),
              Flexible(
                child: CustomText(
                  text,
                  font: font,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: fontColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}