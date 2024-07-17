import 'package:ecommerce_intrazero/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final double width;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final bool disable;
  final bool isBorder;
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final double? height;
  final TextStyle? customTextStyle;
  final double fontSize;
  final BorderRadiusGeometry customBorderRadius;
  final double elevation;

  const CustomTextButton({
    super.key,
    this.width = double.infinity,
    this.background = AppColor.kGoldColor,
    this.isBorder = false,
    this.isUpperCase = true,
    this.radius = 4.0,
    required this.onPressed,
    required this.text,
    this.disable = false,
    this.isLoading = false,
    this.height = 42,
    this.customTextStyle,
    this.fontSize = 18.0,
    this.elevation = 1.0,
    this.customBorderRadius = const BorderRadius.all(Radius.circular(4.0)),
  });

  @override
  Widget build(BuildContext context) {
    final textButton = SizedBox(
      height: height,
      child: TextButton(
        onPressed: disable ? null : onPressed,
        style: TextButton.styleFrom(
          elevation: elevation,
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: customBorderRadius,
            side: isBorder
                ? const BorderSide(color: Colors.red, width: 2.0)
                : BorderSide.none,
          ),
        ),
        child: FittedBox(
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: customTextStyle ??
                TextStyle(
                  color: disable ? AppColor.inactiveTextColor : Colors.black,
                  fontSize: fontSize,
                ),
          ),
        ),
      ),
    );

    final TextButtonLoading = SizedBox(
      height: height,
      child: TextButton(
        onPressed: disable ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: disable ? Colors.grey : background,
          shape: RoundedRectangleBorder(
            borderRadius: customBorderRadius,
            side: isBorder
                ? const BorderSide(color: Colors.red, width: 2.0)
                : BorderSide.none,
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );

    return isLoading
        ? SizedBox(
            height: 45,
            child: TextButtonLoading,
          )
        : SizedBox(
            width: width,
            height: height,
            child: textButton,
          );
  }
}
