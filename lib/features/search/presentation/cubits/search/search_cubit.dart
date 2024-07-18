import 'package:bloc/bloc.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/category/export.dart';
import 'package:ecommerce_intrazero/features/search/export.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchState.initial);

  final _debouncer = Debouncer(const Duration(milliseconds: 500));

  final SearchRepo _searchRepo;

  final controller = TextEditingController();

  void onSearch(String query) {
    _debouncer.call(() => _search(query));
  }

  void _search(String query) async {
    emit(state.loading());
    final response =
        await _searchRepo.serachProduct(productName: query.toLowerCase());
    response.when(
      success: (products) => emit(state.success(products.products)),
      failure: (failure) => emit(state.error()),
    );
  }
}
