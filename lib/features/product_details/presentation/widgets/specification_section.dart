import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecificationSection extends StatelessWidget {
  const SpecificationSection({
    super.key,
    required this.categoryProductModel,
  });

  final CategoryProductModel? categoryProductModel;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Specification',
              style: AppStyle.font18_600Weight,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              categoryProductModel!.description,
              textAlign: TextAlign.justify,
              style: AppStyle.font15_500Weight,
            ),
          ],
        ),
      ),
    );
  }
}
