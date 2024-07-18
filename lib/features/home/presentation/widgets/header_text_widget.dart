import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  final String headerTitle;
  final String? headerSubTitle;

  const HeaderTextWidget({
    super.key,
    required this.headerTitle,
    this.headerSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: "$headerTitle ",
                style: const TextStyle(
                  color: AppColor.kActiveTextColor,
                  fontSize: 20.0,
                ),
                children: [
                  TextSpan(
                    text: headerSubTitle,
                    style: const TextStyle(
                      color: AppColor.kTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
