import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response_body.g.dart';

@JsonSerializable()
class CategoryResponseBody {
  List<CategoryProductModel> products;

  CategoryResponseBody({
    required this.products,
  });

  factory CategoryResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseBodyToJson(this);
}

@JsonSerializable()
class CategoryProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<ReviewsModel> reviews;
  final List<String> images;

  CategoryProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.reviews,
    required this.images,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);
}
@JsonSerializable()
class ReviewsModel {
  final int rating;
  final String reviewerName;
  final String reviewerEmail;
  final String comment;

  ReviewsModel({
    required this.rating,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.comment,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);
}
