import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';

class CategoryItemView extends StatelessWidget {
  final Function()? onTap;
  const CategoryItemView({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Container(
              width: 120,
              decoration: const BoxDecoration(
                color: AppColor.kBorderGreyColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: const Center(
                child: CustomNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://img.freepik.com/free-vector/product-card-design-template_23-2149687359.jpg?t=st=1721244621~exp=1721248221~hmac=67520874f0305e0a19f6a71cbc84976f6acdd1c5a373a3c17659f28071cb5bae&w=1380',
                  placeholderWidget: EmptyGreyContainer(
                    height: 150,
                    width: 120,
                  ),
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Text(
              'Test',
              style: TextStyle(
                overflow: TextOverflow.visible,
                color: AppColor.kActiveTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
