import 'package:dio/dio.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home_layout/export.dart';
import 'package:get_it/get_it.dart';

class CubitsLocator {
  static final GetIt locator = GetIt.instance;

  static void setup() {
    Dio dio = DioFactory.getDio();
    locator.registerLazySingleton<ApiService>(() => ApiService(dio));

    // home layout
    locator.registerLazySingleton<HomeLayoutCubit>(() => HomeLayoutCubit());
  
  }


  static HomeLayoutCubit get homeLayoutCubit => locator<HomeLayoutCubit>();
}
