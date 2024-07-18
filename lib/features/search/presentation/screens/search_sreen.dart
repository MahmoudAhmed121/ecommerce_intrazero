import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_intrazero/features/search/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackGroundColor,
      appBar: AppBar(
        surfaceTintColor: AppColor.kBackGroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo.png',
            color: AppColor.kPrimaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Hero(
              tag: 'search',
              child: Material(
                child: SearchFieldAppbar(
                  readOnly: false,
                  controller: ServiceLocator.searchCubit.controller,
                  onChanged: ServiceLocator.searchCubit.onSearch,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  'Results',
                  style: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
              ],
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state.status == SearchStateStatus.loading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  );
                }
                if (state.status == SearchStateStatus.loaded) {
                  if (state.products!.isEmpty) {
                    return _noResultWidget();
                  }

                  if (state.products!.isNotEmpty && state.products != null) {
                    final products = state.products;

                    return Expanded(
                      child: ListView.builder(
                        itemCount: products?.length ?? 0,
                        itemBuilder: (context, index) {
                          final product = products![index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    categoryProductModel: product,
                                  ),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            title: Text(
                              product.title,
                              style: const TextStyle(
                                color: AppColor.kActiveTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${product.price.toString()} EGP  ',
                                  style: const TextStyle(
                                    color: AppColor.kTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '${product.discountPercentage.toString()} % off',
                                  style: TextStyle(
                                    color: AppColor.kPrimaryColor,
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )),
                            leading: SizedBox(
                              height: 50.0,
                              width: 70.0,
                              child: CachedNetworkImage(
                                imageUrl: product.images.first,
                                fit: BoxFit.cover,
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColor.kPrimaryColor,
                                    ),
                                  );
                                },
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }

                if (state.status == SearchStateStatus.failed) {
                  return _noResultWidget();
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _noResultWidget() {
    return const Expanded(
      child: Center(
        child: Text(
          'No results',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
