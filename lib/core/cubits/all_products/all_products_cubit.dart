import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/data/repos/all_products_repo/all_products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductsCubit extends Cubit<AllProductState> {
  AllProductsCubit(this._productRepo) : super(AllProductState.initial);

  final AllProductsRepo _productRepo;

  Future<void> getAllProducts() async {
    emit(state.loading());

    final respnse = await _productRepo.getAllProducts();
    respnse.when(success: (prodcts) {
      emit(
        state.copyWith(
          status: AllProductStateStatus.success,
          allProductList: prodcts.products,
        ),
      );
      debugPrint(
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${state.allProductList}');
    }, failure: (error) {
      emit(
        state.copyWith(
          status: AllProductStateStatus.error,
          errorMessage: error.errMessages,
        ),
      );
    });
  }
}
