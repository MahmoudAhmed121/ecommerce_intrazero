import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({
    super.key,
    required this.itemCount,
    required this.sliderImages,
  });

  final int itemCount;
  final List<String> sliderImages;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliderMovementCubit(0),
      child: BlocBuilder<SliderMovementCubit, int>(
        builder: (context, currentIndex) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CarouselSlider.builder(
                itemCount: itemCount,
                itemBuilder: (context, index, ib) {
                  return CustomNetworkImage(
                    imageUrl: sliderImages[index],
                    placeholderWidget: EmptyGreyContainer(
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, cursor) {
                    SliderMovementCubit.get(context)
                        .changeCurrentSliderViewIndex(index);
                  },
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  viewportFraction: 1,
                  initialPage: currentIndex,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeFactor: 1,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: AnimatedSmoothIndicator(
                    count: sliderImages.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 14,
                      radius: 16,
                      spacing: 5,
                      activeDotColor: AppColor.kEnableDotColor,
                      dotColor: AppColor.kSubHeading,
                    ),
                    duration: const Duration(milliseconds: 500),
                    activeIndex: currentIndex,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
