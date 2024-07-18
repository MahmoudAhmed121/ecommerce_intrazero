import 'package:dio/dio.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/data/model/category/category_response_body.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.products)
  Future<CategoryResponseBody> getAllProducts();

  @GET('${ApiConstants.products}?limit={limit}&skip={skip}&select={select}')
  Future<ProductsResponse> getProducts(
    @Path("limit") int limit,
    @Path("skip") int skip,
    @Path("select") String select,
  );

  @GET('${ApiConstants.category}{categoryName}')
  Future<CategoryResponseBody> getProductByCategoryName(
    @Path("categoryName") String categoryName,
  );

  @GET('${ApiConstants.search}{product}')
  Future<CategoryResponseBody> serachProduct(
    @Path("product") String categoryName,
  );
}
