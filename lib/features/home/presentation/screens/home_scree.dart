import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:ecommerce_intrazero/features/home/presentation/widgets/category_list_widget.dart';
import 'package:ecommerce_intrazero/features/home/presentation/widgets/header_text_widget.dart';
import 'package:ecommerce_intrazero/features/home/presentation/widgets/product_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: CustomScrollView(
            slivers: [
              HomeAppBar(
                currentHomeTab:
                    CubitsLocator.homeLayoutCubit.state.currentIndex!,
                scrolled: true,
              ),
              const HomeSlider(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              const SliverToBoxAdapter(
                child: HeaderTextWidget(
                  headerTitle: "Categories",
                ),
              ),
              
              const CategoryList(),

              const SliverToBoxAdapter(
                child: HeaderTextWidget(
                  headerTitle: "Products",
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.sizeOf(context).width * 0.5,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const ProductItem();
                  },
                  childCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
