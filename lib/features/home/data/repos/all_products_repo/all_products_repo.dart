import 'package:dio/dio.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/category/export.dart';

class AllProductsRepo {
  final ApiService apiService;
  AllProductsRepo( this.apiService);
  Future<ApiResult<CategoryResponseBody>> getAllProducts() async {
    try {
      final response = await apiService.getAllProducts();
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ServerFailure.fromDioError(e));
    }
  }
}