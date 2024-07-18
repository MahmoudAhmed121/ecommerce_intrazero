import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoginLogoSection(),
                SizedBox(
                  height: 20.h,
                ),
                const LoginFormFaildSection(),
                SizedBox(
                  height: 20.h,
                ),
                const DontHaveAccountSection(),
                const LoginBlocListner(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: CustomBottomsheet(
        onPressed: () {
          ServiceLocator.loginCubit.login();
        },
        text: 'Sign Up',
      ),
    );
  }
}
