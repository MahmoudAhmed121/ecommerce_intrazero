import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';

class ProductLodaingGrid extends StatelessWidget {
  const ProductLodaingGrid({
    super.key,
  });

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
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: EmptyGreyContainer(
              width: MediaQuery.sizeOf(context).width,
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
