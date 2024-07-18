import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:ecommerce_intrazero/features/category/export.dart';
import 'package:ecommerce_intrazero/features/product_details/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, this.categoryProductModel});
  final CategoryProductModel? categoryProductModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: CustomScrollView(
          slivers: [
            CustomAppBar(
              title: categoryProductModel!.title,
            ),
            SliverToBoxAdapter(
              child: HomeSliderWidget(
                sliderImages: categoryProductModel!.images,
                itemCount: categoryProductModel!.images.length,
              ),
            ),
            ProductPriceSection(
              categoryProductModel: categoryProductModel,
            ),
            SpecificationSection(
              categoryProductModel: categoryProductModel,
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
            ReviewProductListViewWidget(
              categoryProductModel: categoryProductModel,
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
