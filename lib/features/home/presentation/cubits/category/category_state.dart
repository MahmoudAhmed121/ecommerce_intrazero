import 'package:ecommerce_intrazero/features/home/export.dart';

enum CategoryStateStatus {
  initial,
  loading,
  success,
  error,
}

class CategoryState {
  final CategoryStateStatus? status;
  final List<CategoryProductModel>? categoryProducts;
  final String? errorMessage;

  CategoryState._({
    this.status,
    this.errorMessage,
    this.categoryProducts,
  });

  static CategoryState initial = CategoryState._(
    status: CategoryStateStatus.initial,
    errorMessage: null,
    categoryProducts: [],
  );

  CategoryState init() => copyWith(status: CategoryStateStatus.initial);

  CategoryState loading() => copyWith(status: CategoryStateStatus.loading);

  CategoryState success() => copyWith(status: CategoryStateStatus.success);

  CategoryState error(String errorMessage) => copyWith(
        status: CategoryStateStatus.error,
        errorMessage: errorMessage,
      );

  CategoryState copyWith({
    CategoryStateStatus? status,
    String? errorMessage,
    List<CategoryProductModel>? categoryProducts,
  }) {
    return CategoryState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      categoryProducts: categoryProducts ?? this.categoryProducts,
    );
  }

  @override
  String toString() =>
      'CategoryStateStatusState(status: $status, errorMessage: $errorMessage)';
}
