import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisLogoSection extends StatelessWidget {
  const RegisLogoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          color: AppColor.kPrimaryColor,
          width: size.width * 0.2,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Lets get started',
          style: AppStyle.font14_700Weight.copyWith(
            color: AppColor.kSecondaryColor,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Create an new account',
          style: AppStyle.font12_400Weight.copyWith(
            color: AppColor.kEnableDotColor,
          ),
        ),
      ],
    );
  }
}
