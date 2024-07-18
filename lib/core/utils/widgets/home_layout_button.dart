import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeLayoutButton extends StatelessWidget {
  const HomeLayoutButton({
    super.key,
    required this.image,
    required this.title,
    this.titleColor,
    this.imageColor,
  });
  final String image;
  final String title;
  final Color? titleColor;
  final Color? imageColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          image,
          color: imageColor ?? AppColor.kTextColor,
          height: 25.h,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          style: AppStyle.font12_400Weight.copyWith(
            color: titleColor,
          ),
        )
      ],
    );
  }
}
