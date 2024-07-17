import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.actionWidget,
    this.title,
    this.pinned = true,
    this.centerTitle = false,
  });

  final Widget? actionWidget;
  final String? title;
  final bool pinned;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      centerTitle: centerTitle,
      backgroundColor: AppColor.kBackGroundColor,
      pinned: true,
      surfaceTintColor: AppColor.kBackGroundColor,
      title: title != null
          ? Text(
              title!,
              style: textTheme.headlineLarge,
            )
          : const SizedBox(),
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: BackButton(
          style: IconButton.styleFrom(
            iconSize: 18.0,
          ),
        ),
      ),
      actions: [
        if (actionWidget != null) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: actionWidget!,
          ),
        ],
      ],
    );
  }
}
