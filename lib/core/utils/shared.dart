import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:ecommerce_intrazero/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) => PopScope(
      canPop: false,
      child: ModalProgressHUD(
        inAsyncCall: true,
        progressIndicator: Lottie.asset(
          'assets/animations/loading.json',
          fit: BoxFit.cover,
          width: 100.w,
        ),
        color: AppColor.kEnableDotColor,
        blur: 1,
        child: const SizedBox(),
      ),
    ),
  );
}

void showErrorToast(BuildContext context, String message) {
  DelightToastBar(
    position: DelightSnackbarPosition.top,
    snackbarDuration: const Duration(seconds: 5),
    animationCurve: Curves.easeInOut,
    autoDismiss: true,
    builder: (context) => ToastCard(
      color: AppColor.kPrimaryColor,
      leading: Icon(
        Icons.error_outline,
        size: 28.sp,
      ),
      title: Text(
        message,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
        ),
      ),
    ),
  ).show(context);
}
