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
      ServiceLocator.productsCubit.getPagenationProducts();
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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
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
                    return const ProductLodaingGrid();
                  }
                  if (state.status == ProductStateStatus.error) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.errorMessage ?? 'Error')),
                    );
                  }
                  return HomeProductWidget(
                    products: state.products!,
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
