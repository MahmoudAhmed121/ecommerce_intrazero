import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                      imageUrl:
                          'https://img.freepik.com/free-vector/product-card-design-template_23-2149687359.jpg?t=st=1721244621~exp=1721248221~hmac=67520874f0305e0a19f6a71cbc84976f6acdd1c5a373a3c17659f28071cb5bae&w=1380',
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

                  // Discount rounded container

                  Align(
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
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            const Flexible(
              flex: 1,
              child: Text(
                'Test',
                style: TextStyle(
                  fontFamily: 'NoteSans-SemiBold',
                  color: AppColor.kActiveTextColor,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: RichText(
                text: const TextSpan(
                  text: '100' ' ' 'EGP' "  ",
                  style: TextStyle(
                    color: AppColor.kTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: '200 ' 'EGP',
                      style: TextStyle(
                        fontFamily: 'NoteSans-Light',
                        color: AppColor.kTextColor,
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
}
