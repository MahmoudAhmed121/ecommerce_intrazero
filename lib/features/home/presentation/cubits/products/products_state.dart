import 'package:ecommerce_intrazero/features/home/export.dart';

enum ProductStateStatus {
  initial,
  loading,
  success,
  error,
}

class ProductState {
  final ProductStateStatus? status;
  final List<ProductResponseModel>? products;
  final String? errorMessage;
  final int? total;

  ProductState._({
    this.status,
    this.errorMessage,
    this.products,
    this.total,
  });

  static ProductState initial = ProductState._(
    status: ProductStateStatus.initial,
    errorMessage: null,
    products: [],
    total: 0,
  );

  ProductState init() => copyWith(status: ProductStateStatus.initial);

  ProductState loading() => copyWith(status: ProductStateStatus.loading);

  ProductState success(List<ProductResponseModel> products , int total) => copyWith(
        status: ProductStateStatus.success,
        products: products,
        total: total,
      );

  ProductState error(String errorMessage) => copyWith(
        status: ProductStateStatus.error,
        errorMessage: errorMessage,
      );

  ProductState copyWith({
    ProductStateStatus? status,
    String? errorMessage,
    List<ProductResponseModel>? products,
    int? total,
  }) {
    return ProductState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
      total: total ?? this.total,
    );
  }

  @override
  String toString() =>
      'ProductState(status: $status, products: ${products?.length}, errorMessage: $errorMessage)';
}
