// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseBody _$CategoryResponseBodyFromJson(
        Map<String, dynamic> json) =>
    CategoryResponseBody(
      products: (json['products'] as List<dynamic>)
          .map((e) => CategoryProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryResponseBodyToJson(
        CategoryResponseBody instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

CategoryProductModel _$CategoryProductModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CategoryProductModelToJson(
        CategoryProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'reviews': instance.reviews,
      'images': instance.images,
    };

ReviewsModel _$ReviewsModelFromJson(Map<String, dynamic> json) => ReviewsModel(
      rating: (json['rating'] as num).toInt(),
      reviewerName: json['reviewerName'] as String,
      reviewerEmail: json['reviewerEmail'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ReviewsModelToJson(ReviewsModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
      'comment': instance.comment,
    };
