import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItemView extends StatelessWidget {
  final Function()? onTap;
  const CategoryItemView({
    super.key,
    required this.onTap,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

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
              child: Center(
                child: CustomNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: categoryModel.image,
                  placeholderWidget: const EmptyGreyContainer(
                    height: 150,
                    width: 120,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              categoryModel.name,
              style: const TextStyle(
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
