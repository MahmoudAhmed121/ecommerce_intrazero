import 'package:ecommerce_intrazero/features/cart/export.dart';
import 'package:ecommerce_intrazero/features/category/presentation/screens/category_screen.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:ecommerce_intrazero/features/home_layout/export.dart';
import 'package:ecommerce_intrazero/features/profile/export.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutState.initial);

  final pageController = PageController();

  List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    state.currentIndex = index;
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
    emit(state.success());
  }
}
