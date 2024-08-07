import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/core/utils/widgets/default_user_avatar.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:ecommerce_intrazero/features/home/data/model/category/category_response_body.dart';
import 'package:ecommerce_intrazero/features/product_details/presentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/home_slider_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, this.categoryProductModel});
  final CategoryProductModel? categoryProductModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: CustomScrollView(
          slivers: [
            CustomAppBar(
              title: widget.categoryProductModel!.title,
            ),
            SliverToBoxAdapter(
              child: HomeSliderWidget(
                sliderImages: widget.categoryProductModel!.images,
                itemCount: widget.categoryProductModel!.images.length,
              ),
            ),
            SliverToBoxAdapter(
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
                          widget.categoryProductModel!.title,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.font20_600Weight,
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
                      currentRating: widget.categoryProductModel!.rating,
                      ignoreGestures: true,
                      itemSize: 35.w,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: widget.categoryProductModel!.price.toString(),
                        style: AppStyle.font18_600Weight
                            .copyWith(color: AppColor.kSecondaryColor),
                        children: [
                          TextSpan(
                            text: ' EGP  ',
                            style: AppStyle.font18_600Weight,
                          ),
                          TextSpan(
                            text:
                                '${widget.categoryProductModel!.discountPercentage} % off',
                            style: AppStyle.font18_600Weight.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColor.kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
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
                      widget.categoryProductModel!.description,
                      textAlign: TextAlign.justify,
                      style: AppStyle.font15_500Weight,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                ),
                child: Text(
                  'Review Product',
                  style: AppStyle.font18_600Weight,
                ),
              ),
            ),
            SliverGrid(
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
                            Text(widget.categoryProductModel!
                                .reviews[index].reviewerName),
                            RatingBarWidget(
                              currentRating: widget.categoryProductModel!
                                  .reviews[index].rating
                                  .toInt()
                                  .toDouble(),
                              ignoreGestures: true,
                              itemSize: 20.w,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          widget.categoryProductModel!.reviews[index].reviewerEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.h),
                        child: Text(
                          widget.categoryProductModel!.reviews[index].comment,
                          textAlign: TextAlign.justify,
                          style: AppStyle.font15_500Weight,
                        ),
                      ),
                    ],
                  );
                },
                childCount: widget.categoryProductModel!.reviews.length,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40.h,
              ),
            )
          ],
        ),
      ),
      bottomSheet: CustomBottomsheet(
        onPressed: () {},
        text: 'Add To Cart',
      ),
    );
  }
}
//ReviewProductListViewWidget