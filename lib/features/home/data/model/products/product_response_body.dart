import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response_body.g.dart';

@JsonSerializable()
class ProductsResponse {
  final List<ProductResponseModel> products;
  final int total;

  ProductsResponse({
    required this.products,
    required this.total,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}

@JsonSerializable()
class ProductResponseModel {
  final int id;
  final String thumbnail;
  final String title;
  final double price;

  ProductResponseModel({
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.price,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}
