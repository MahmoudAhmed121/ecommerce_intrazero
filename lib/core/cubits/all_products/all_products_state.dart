import 'package:ecommerce_intrazero/features/category/export.dart';

enum AllProductStateStatus {
  initial,
  loading,
  success,
  error,
}

class AllProductState {
  final AllProductStateStatus? status;
  final List<CategoryProductModel>? allProductList;
  final String? errorMessage;

  AllProductState._({
    this.status,
    this.errorMessage,
    this.allProductList,
  });

  static AllProductState initial = AllProductState._(
    status: AllProductStateStatus.initial,
    errorMessage: null,
    allProductList: [],
  );

  AllProductState init() => copyWith(status: AllProductStateStatus.initial);

  AllProductState loading() => copyWith(status: AllProductStateStatus.loading);

  AllProductState success() => copyWith(status: AllProductStateStatus.success);

  AllProductState error(String errorMessage) => copyWith(
        status: AllProductStateStatus.error,
        errorMessage: errorMessage,
      );

  AllProductState copyWith({
    AllProductStateStatus? status,
    String? errorMessage,
    List<CategoryProductModel>? allProductList,
  }) {
    return AllProductState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      allProductList: allProductList ?? allProductList,
    );
  }

  @override
  String toString() =>
      'AllProductStateStatusState(status: $status, errorMessage: $errorMessage)';
}
