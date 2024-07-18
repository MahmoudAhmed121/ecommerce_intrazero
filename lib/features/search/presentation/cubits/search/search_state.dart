part of 'search_cubit.dart';

enum SearchStateStatus { initial, loading, loaded, refresh, failed }

class SearchState {
  final SearchStateStatus? status;
  final List<CategoryProductModel>? products;

  const SearchState._({
    this.status,
    this.products = const [],
  });

  static const SearchState initial = SearchState._(
    status: SearchStateStatus.initial,
    products: [],
  );

  SearchState loading() => copyWith(status: SearchStateStatus.loading);

  SearchState error() => copyWith(status: SearchStateStatus.failed);

  SearchState success(List<CategoryProductModel> products) => copyWith(
        status: SearchStateStatus.loaded,
        products: products,
      );

  SearchState refresh() => copyWith(status: SearchStateStatus.refresh);

  SearchState copyWith({
    SearchStateStatus? status,
    List<CategoryProductModel>? products,
  }) {
    return SearchState._(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  String toString() => "SearchState: status is $status";
}
