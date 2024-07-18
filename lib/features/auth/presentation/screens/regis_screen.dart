import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisScreen extends StatelessWidget {
  const RegisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: PopScope(
          canPop: false,
          child: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    const RegisLogoSection(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const RegisFormFaildSection(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const HaveAcountSection(),
                    const RegisBlocListner(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: CustomBottomsheet(
        onPressed: () {
          ServiceLocator.regisCubit.createAccount();
        },
        text: 'Login',
      ),
    );
  }
}
