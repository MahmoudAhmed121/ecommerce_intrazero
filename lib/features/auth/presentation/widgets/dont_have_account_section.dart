import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';

class DontHaveAccountSection extends StatelessWidget {
  const DontHaveAccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?  ',
          style: AppStyle.font12_400Weight,
        ),
        InkWell(
          onTap: () {
            context.pushReplacementNamed(registerScreen);
          },
          child: Text(
            'Register',
            style: AppStyle.font12_400Weight.copyWith(
              color: AppColor.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
