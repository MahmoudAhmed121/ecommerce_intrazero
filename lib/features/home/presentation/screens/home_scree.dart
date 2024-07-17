import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/data/model/banner_model.dart';
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 170.0.h,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1,
                    ),
                    items: bannerList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            width: MediaQuery.sizeOf(context).width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                bannerList[bannerList.indexOf(i)].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
