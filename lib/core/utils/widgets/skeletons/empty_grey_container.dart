import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';

class EmptyGreyContainer extends StatelessWidget {
  final double? height;
  final double? width;

  const EmptyGreyContainer({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.greyColor.withOpacity(0.5),
      ),
    );
  }
}
