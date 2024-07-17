import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomsheet extends StatelessWidget {
  const CustomBottomsheet({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + 5.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(color: AppColor.kBorderGreyColor, width: 1),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 7.h),
        child: CustomTextButton(
          onPressed: onPressed,
          text: text,
          isUpperCase: false,
        ),
      ),
    );
  }
}
