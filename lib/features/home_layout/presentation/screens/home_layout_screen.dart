import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/core/utils/widgets/home_layout_button.dart';
import 'package:ecommerce_intrazero/features/home_layout/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = CubitsLocator.homeLayoutCubit.pageController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: CubitsLocator.homeLayoutCubit.screens,
      ),
      bottomNavigationBar: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, state) {
          return NavigationBar(
            overlayColor: const MaterialStatePropertyAll<Color>(Colors.white),
            backgroundColor: Colors.white,
            indicatorColor: Colors.white,
            height: kBottomNavigationBarHeight + 10.h,
            elevation: 0,
            selectedIndex: state.currentIndex!,
            onDestinationSelected: (value) =>
                CubitsLocator.homeLayoutCubit.changeIndex(value),
            destinations: const [
              NavigationDestination(
                icon: HomeLayoutButton(
                  image: 'assets/images/home.svg',
                  title: 'Home',
                  imageColor: AppColor.kTextColor,
                  titleColor: AppColor.kTextColor,
                ),
                selectedIcon: HomeLayoutButton(
                  image: 'assets/images/home.svg',
                  imageColor: AppColor.kPrimaryColor,
                  titleColor: AppColor.kTextColor,
                  title: 'Home',
                ),
                label: "",
              ),
              NavigationDestination(
                icon: HomeLayoutButton(
                  image: 'assets/images/shopping_cart.svg',
                  title: 'Unknown',
                  titleColor: AppColor.kTextColor,
                ),
                selectedIcon: HomeLayoutButton(
                  image: 'assets/images/shopping_cart.svg',
                  imageColor: AppColor.kPrimaryColor,
                  titleColor: AppColor.kTextColor,
                  title: 'Unknown',
                ),
                label: "",
              ),
              NavigationDestination(
                icon: HomeLayoutButton(
                  image: 'assets/images/user.svg',
                  title: 'My Account',
                  titleColor: AppColor.kTextColor,
                ),
                selectedIcon: HomeLayoutButton(
                  image: 'assets/images/user.svg',
                  imageColor: AppColor.kPrimaryColor,
                  titleColor: AppColor.kTextColor,
                  title: 'My Account',
                ),
                label: "",
              ),
            ],
          );
        },
      ),
    );
  }
}
