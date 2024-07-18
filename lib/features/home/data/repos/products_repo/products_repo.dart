import 'package:dio/dio.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';

class ProductRepo {
  ApiService apiService;

  ProductRepo(this.apiService);

  Future<ApiResult<ProductsResponse>> getProducts(
      {required int limit, required int skip, required String select}) async {
    try {
      final response = await apiService.getProducts(limit, skip, select);

      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ServerFailure.fromDioError(e));
    }
  }
}
