import 'package:flutter/material.dart';
import 'package:oncopower/molecules/custom_text.dart';
import 'package:oncopower/utils/color_resources.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Color backGroundColor;

  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final Color? borderColor;
  final TextAlign textAlign;
  final Function()? onPressed;
  final Color fontColor;
  final Widget? icon;
  final Color? splashColor;
  final Gradient? gradient;
  final double horizontalPadding;
  final double verticalPadding;

  const CustomButton(
      {required this.text,
      this.backGroundColor = ColorResource.colorffbb00,
    
      this.fontSize = 16,
      this.borderRadius = 20,
      required this.onPressed,
      this.textAlign = TextAlign.center,
      this.fontColor = ColorResource.colorffffff,
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
          fixedSize: const Size(300, 50),
          foregroundColor: splashColor,
          backgroundColor:
              gradient != null ? ColorResource.colorffbb00 : backGroundColor,
          shape: RoundedRectangleBorder(
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
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
            
                  fontSize: fontSize,
                  textAlign: textAlign,
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
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.context,
    this.text,
    this.onPressed,
    this.style,
    this.primary,
    this.textStyle,
    this.icon,
    required this.child,
    this.backgroundColor,
    this.color,
    this.padding,
  }) : super(key: key);

  final BuildContext? context;
  final String? text;
  final VoidCallback? onPressed;
  final dynamic style;
  final Icon? icon;
  final Color? primary;
  final dynamic backgroundColor;
  final TextStyle? textStyle;
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          foregroundColor: primary,
          padding: padding,
          backgroundColor: backgroundColor),
      child: child,
    );
  }
}
