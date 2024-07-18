import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/category/export.dart';
import 'package:ecommerce_intrazero/features/product_details/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPriceSection extends StatelessWidget {
  const ProductPriceSection({
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryProductModel!.title,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.font17_700Weight,
                ),
                Container(
                  height: 32,
                  width: 32,
                  margin: const EdgeInsets.all(3.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ],
            ),
            RatingBarWidget(
              currentRating: categoryProductModel!.rating,
              ignoreGestures: true,
              itemSize: 35.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: categoryProductModel!.price.toString(),
                    style: AppStyle.font18_600Weight
                        .copyWith(color: AppColor.kSecondaryColor),
                    children: [
                      TextSpan(
                        text: ' EGP  ',
                        style: AppStyle.font18_600Weight,
                      ),
                      TextSpan(
                        text:
                            '${categoryProductModel!.discountPercentage} % off',
                        style: AppStyle.font18_600Weight.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColor.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: categoryProductModel!.stock.toString(),
                    style: AppStyle.font14_700Weight
                        .copyWith(color: AppColor.kLightGreen),
                    children: [
                      TextSpan(
                        text: ' Pieces are available',
                        style: AppStyle.font14_700Weight.copyWith(
                          color: AppColor.kLightGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
