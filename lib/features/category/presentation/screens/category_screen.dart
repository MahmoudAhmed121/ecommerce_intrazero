import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeAppBar(
            scrolled: true,
            currentHomeTab: ServiceLocator.homeLayoutCubit.state.currentIndex!,
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  mainAxisSpacing: 18.0,
                ),
                itemBuilder: (context, index) {
                  return Center(
                    child: CategoryItemView(
                      categoryModel: categoryList[index],
                      onTap: () => _onCategoryItemTapped(
                          categoryList[index].name, context),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onCategoryItemTapped(String categoryName, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: ServiceLocator.categoryCubit,
          child: CategoryHomeProductScreen(
            categoryName: categoryName,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
