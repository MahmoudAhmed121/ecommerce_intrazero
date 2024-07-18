import 'package:ecommerce_intrazero/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

class NotificationAppbar extends StatelessWidget {
  const NotificationAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(8.0),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          border: Border.all(
            color: AppColor.kBorderGreyColor,
            width: 2.0,
          ),
        ),
        child: const Icon(
          Icons.notifications_none_rounded,
          size: 24.0,
        ),
      ),
      onPressed: () {},
    );
  }
}
