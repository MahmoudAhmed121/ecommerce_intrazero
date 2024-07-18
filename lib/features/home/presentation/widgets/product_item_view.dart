import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.pagenationProduct,
    this.categoryProductModel,
  });
  final ProductResponseModel? pagenationProduct;
  final CategoryProductModel? categoryProductModel;

  @override
  Widget build(BuildContext context) {
    final bool hasCategoryProductOddIndex = categoryProductModel != null && categoryProductModel!.id % 3 != 0;
    final bool hasProductsOddIndex = pagenationProduct != null && pagenationProduct!.id % 3 != 0;

    
    return GestureDetector(
      onTap: () => _onProductTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  SizedBox(
                    height: 130,
                    child: CustomNetworkImage(
                      radius: 5,
                      imageUrl: pagenationProduct == null
                          ? categoryProductModel!.images.first
                          : pagenationProduct!.thumbnail,
                      width: MediaQuery.sizeOf(context).width,
                      placeholderWidget: EmptyGreyContainer(
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    margin: const EdgeInsets.all(3.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                      size: 17,
                    ),
                  ),
                  hasCategoryProductOddIndex || hasProductsOddIndex
                      ? const SizedBox()
                      : Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            height: 20,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: AppColor.kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Discount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            Flexible(
              flex: 1,
              child: Text(
                pagenationProduct == null
                    ? categoryProductModel!.title
                    : pagenationProduct!.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColor.kActiveTextColor,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: RichText(
                text: TextSpan(
                  text: pagenationProduct == null
                      ? '${categoryProductModel!.price}' ' ' 'EGP' "  "
                      : '${pagenationProduct!.price}' ' ' 'EGP' "  ",
                  style: const TextStyle(
                    color: AppColor.kTextColor,
                  ),
                  children: const [
                    TextSpan(
                      text: '200 ' 'EGP',
                      style: TextStyle(
                        color: AppColor.kPrimaryColor,
                        fontSize: 14.0,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onProductTap(BuildContext context) {
    if (categoryProductModel == null) {
      final productDetails =
          ServiceLocator.allProductsCubit.state.allProductList!.firstWhere(
        (product) => product.id == pagenationProduct!.id,
      );
      context.pushNamed(productDetailsScreen, arguments: productDetails);
    } else {
      context.pushNamed(productDetailsScreen, arguments: categoryProductModel);
    }
  }
}
