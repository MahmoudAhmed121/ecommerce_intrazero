import 'package:dio/dio.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:ecommerce_intrazero/features/category/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:ecommerce_intrazero/features/home_layout/export.dart';
import 'package:ecommerce_intrazero/features/search/export.dart';
import 'package:get_it/get_it.dart';


class ServiceLocator {
  static final GetIt locator = GetIt.instance;

  static void setup() {
    Dio dio = DioFactory.getDio();
    locator.registerLazySingleton<ApiService>(() => ApiService(dio));

    // home layout
    locator.registerLazySingleton<HomeLayoutCubit>(() => HomeLayoutCubit());

    // login
    locator.registerLazySingleton<LoginCubit>(() => LoginCubit());

    // register
    locator.registerLazySingleton<RegisCubit>(() => RegisCubit());

    // products
    locator.registerFactory<ProductRepo>(() => ProductRepo(locator()));
    locator.registerLazySingleton<ProductsCubit>(() => ProductsCubit(locator()));

    // categorie
    locator.registerFactory<CategoryRepo>(() => CategoryRepo(locator()));
    locator.registerLazySingleton<CategoryCubit>(() => CategoryCubit(locator()));

    // all products
    locator.registerFactory<AllProductsRepo>(() => AllProductsRepo(locator()));
    locator.registerLazySingleton<AllProductsCubit>(() => AllProductsCubit(locator()));

    // search 
    locator.registerFactory<SearchRepo>(() => SearchRepo(locator()));
    locator.registerLazySingleton<SearchCubit>(() => SearchCubit(locator()));

  }

  static HomeLayoutCubit get homeLayoutCubit => locator<HomeLayoutCubit>();

  static LoginCubit get loginCubit => locator<LoginCubit>();

  static RegisCubit get regisCubit => locator<RegisCubit>();

  static ProductsCubit get productsCubit => locator<ProductsCubit>();

  static CategoryCubit get categoryCubit => locator<CategoryCubit>();

  static AllProductsCubit get allProductsCubit => locator<AllProductsCubit>();

  static SearchCubit get searchCubit => locator<SearchCubit>();
}
