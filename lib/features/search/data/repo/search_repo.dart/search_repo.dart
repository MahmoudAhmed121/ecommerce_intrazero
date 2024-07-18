import 'package:dio/dio.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';

class SearchRepo {
  final ApiService apiService;

  SearchRepo( this.apiService);

  Future<ApiResult<CategoryResponseBody>> serachProduct(
      {required String productName}) async {
    try {
      final response = await apiService.serachProduct(productName);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ServerFailure.fromDioError(e));
    }
  }
}
