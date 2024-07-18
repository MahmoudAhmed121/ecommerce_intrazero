import 'package:ecommerce_intrazero/features/category/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/material.dart';

class HomeProductWidget extends StatelessWidget {
  const HomeProductWidget({
    super.key,
    this.products,
    this.categoryProducts,
  });
  final List<ProductResponseModel>? products;
  final List<CategoryProductModel>? categoryProducts;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.sizeOf(context).width * 0.5,
        crossAxisSpacing: 0.0,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return products == null
              ? ProductItem(
                  categoryProductModel: categoryProducts![index],
                )
              : ProductItem(
                  pagenationProduct: products![index],
                );
        },
        childCount:
            products == null ? categoryProducts!.length : products!.length,
      ),
    );
  }
}
