import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';

class HaveAcountSection extends StatelessWidget {
  const HaveAcountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'have a account?  ',
          style: AppStyle.font12_400Weight,
        ),
        InkWell(
          onTap: () {
            context.pushReplacementNamed(loginScreen);
          },
          child: Text(
            'Sign In',
            style: AppStyle.font12_400Weight.copyWith(
              color: AppColor.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
