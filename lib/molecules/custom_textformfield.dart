import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oncopower/utils/color_resources.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Color inputTextColor;
  final double inputTextSize;

  final FontWeight inputFontWeight;
  final String? hintText;
  final String? labelText;
  final Color labelColor;
  final Color hintColor;
  final double hintSize;

  final FontWeight hintFontWeight;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final bool isEnabled;
  final Iterable<String>? autofillHints;
  final TextCapitalization textCapitalization;
  final bool autoFocus;
  final double borderRadius;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget;
  final double horizontalPadding;
  final double verticalPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final Widget? leadingWidget;
  final BoxConstraints? leadingWidgetContraints;

  final bool isObscure;
  final int maxLines;
  final Function(String)? onChanged;
  final Function()? onTap;
  final ValueChanged<String>? onFieldSubmitted;

  const CustomTextField({
    this.controller,
    this.hintText,
    this.labelText,
    this.labelColor = ColorResource.color1a1a1a,
    this.hintColor = ColorResource.color82808e,
    this.hintSize = 14,
    this.inputTextColor = ColorResource.color1a1a1a,
    this.inputTextSize = 14,
    this.keyboardType,
    this.isEnabled = true,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.autofillHints,
    this.textCapitalization = TextCapitalization.none,
    this.autoFocus = false,
    this.onChanged,
    this.onTap,
    this.leadingWidgetContraints,
    this.fillColor,
    this.borderRadius = 20,
    this.isObscure = false,
    this.borderColor = ColorResource.hashgray,
    this.horizontalPadding = 16,
    this.verticalPadding = 8,
    this.horizontalMargin = 16,
    this.verticalMargin = 0,
    this.suffixWidget,
    this.leadingWidget,
    this.inputFontWeight = FontWeight.w400,
    this.hintFontWeight = FontWeight.w400,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 50, bottom: 40),
        //   child: Container(
        //     color: ColorResource.white,
        //     child: CustomText(S.of(context).lableEmailId),
        //   ),
        // ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin,
            vertical: verticalMargin,
          ),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                  )
                : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyboardType,
                    enabled: isEnabled,
                    autofocus: autoFocus,
                    onFieldSubmitted: onFieldSubmitted,
                    autofillHints: autofillHints,
                    textCapitalization: textCapitalization,
                    inputFormatters: inputFormatters,
                    onChanged: onChanged,
                    onTap: onTap,
                    obscureText: isObscure,
                    maxLines: maxLines,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: inputTextColor,
                        fontSize: inputTextSize,
                        fontWeight: inputFontWeight,
                      ),
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                      labelText: labelText,
                      hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: hintColor,
                          fontSize: hintSize,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding,
                      ),
                      prefixIcon: leadingWidget,
                      prefixIconConstraints: leadingWidgetContraints,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              if (suffixWidget != null)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: suffixWidget,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
