import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:ecommerce_intrazero/features/product_details/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewProductListViewWidget extends StatelessWidget {
  const ReviewProductListViewWidget({
    super.key,
    required this.categoryProductModel,
  });

  final CategoryProductModel? categoryProductModel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.sizeOf(context).width,
        crossAxisSpacing: 0.0,
        childAspectRatio: 12 / 3,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const DefaultAvatar(
                  imageUrl:
                      'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                  size: 30,
                  padding: 0,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(categoryProductModel!.reviews[index].reviewerName),
                    RatingBarWidget(
                      currentRating: categoryProductModel!.reviews[index].rating
                          .toInt()
                          .toDouble(),
                      ignoreGestures: true,
                      itemSize: 20.w,
                    ),
                  ],
                ),
                subtitle: Text(
                  categoryProductModel!.reviews[index].reviewerEmail,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Text(
                  categoryProductModel!.reviews[index].comment,
                  textAlign: TextAlign.justify,
                  style: AppStyle.font15_500Weight,
                ),
              ),
            ],
          );
        },
        childCount: categoryProductModel!.reviews.length,
      ),
    );
  }
}
