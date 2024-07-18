import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    ServiceLocator.productsCubit.getProducts();
    super.initState();
    scrollController.addListener(() {
      loadMore();
    });
  }

  void loadMore() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        ServiceLocator.productsCubit.state.products!.length <
            ServiceLocator.productsCubit.state.total!) {
      ServiceLocator.productsCubit.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              HomeAppBar(
                currentHomeTab:
                    ServiceLocator.homeLayoutCubit.state.currentIndex!,
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
              BlocBuilder<ProductsCubit, ProductState>(
                buildWhen: (previous, current) =>
                    current.status == ProductStateStatus.success ||
                    current.status == ProductStateStatus.loading ||
                    current.status == ProductStateStatus.error,
                builder: (context, state) {
                  if (state.status == ProductStateStatus.loading &&
                      state.products!.isEmpty) {
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.sizeOf(context).width * 0.5,
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
                  if (state.status == ProductStateStatus.error) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.errorMessage ?? 'Error')),
                    );
                  }
                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          MediaQuery.sizeOf(context).width * 0.5,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: 1,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (index < state.products!.length) {
                          return ProductItem(
                            products: state.products![index],
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          child: EmptyGreyContainer(
                            width: MediaQuery.sizeOf(context).width,
                          ),
                        );
                      },
                      childCount: state.products!.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
