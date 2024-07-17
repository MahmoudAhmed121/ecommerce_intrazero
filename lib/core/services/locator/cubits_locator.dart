import 'package:dio/dio.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/auth/presentation/cubits/login_cubit.dart';
import 'package:ecommerce_intrazero/features/home_layout/export.dart';
import 'package:get_it/get_it.dart';

class CubitsLocator {
  static final GetIt locator = GetIt.instance;

  static void setup() {
    Dio dio = DioFactory.getDio();
    locator.registerLazySingleton<ApiService>(() => ApiService(dio));

    // home layout
    locator.registerLazySingleton<HomeLayoutCubit>(() => HomeLayoutCubit());

    // login 
    locator.registerLazySingleton<LoginCubit>(() => LoginCubit());
  
  }


  static HomeLayoutCubit get homeLayoutCubit => locator<HomeLayoutCubit>();

  static LoginCubit get loginCubit => locator<LoginCubit>();
}
