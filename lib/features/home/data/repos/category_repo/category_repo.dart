import 'package:dio/dio.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';

class CategoryRepo {
  final ApiService apiService;
  CategoryRepo(this.apiService);

  Future<ApiResult<CategoryResponseBody>> getProductByCategoryName({required String categoryName}) async {
    try {
      final response = await apiService.getProductByCategoryName(categoryName);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ServerFailure.fromDioError(e));
    }
  }
}
