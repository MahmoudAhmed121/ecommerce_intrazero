import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/data/model/category_model.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categoryList[index];
              return CategoryItemView(
                categoryModel: category,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: ServiceLocator.categoryCubit,
                        child: CategoryHomeProductScreen(
                          categoryName: category.name,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryHomeProductScreen extends StatefulWidget {
  const CategoryHomeProductScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<CategoryHomeProductScreen> createState() =>
      _CategoryHomeProductScreenState();
}

class _CategoryHomeProductScreenState extends State<CategoryHomeProductScreen> {
  @override
  void initState() {
    super.initState();
    ServiceLocator.categoryCubit
        .getProductByCategorieName(categoryName: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: widget.categoryName,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          BlocBuilder<CategoryCubit, CategoryState>(
            buildWhen: (previous, current) =>
                current.status == CategoryStateStatus.success ||
                current.status == CategoryStateStatus.loading ||
                current.status == CategoryStateStatus.error,
            builder: (context, state) {
              if (state.status == CategoryStateStatus.loading &&
                  state.categoryProducts != null) {
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.sizeOf(context).width * 0.5,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 1,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        child: EmptyGreyContainer(
                          width: MediaQuery.sizeOf(context).width,
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                );
              }
              if (state.status == CategoryStateStatus.error) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.errorMessage ?? 'Error')),
                );
              }
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.sizeOf(context).width * 0.5,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ProductItem(
                      categoryProductModel: state.categoryProducts![index],
                    );
                  },
                  childCount: state.categoryProducts!.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
