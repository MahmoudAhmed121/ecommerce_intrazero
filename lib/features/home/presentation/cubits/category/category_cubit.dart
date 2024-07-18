import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepo) : super(CategoryState.initial);

  final CategoryRepo _categoryRepo;

  Future<void> getProductByCategorieName({required String categoryName}) async {
    emit(state.loading());

    final response = await _categoryRepo.getProductByCategoryName(
        categoryName: categoryName);

    response.when(success: (success) {
      debugPrint(success.products.first.title.toString());
      emit(
        state.copyWith(status: CategoryStateStatus.success, categoryProducts: success.products),
      );
    }, failure: (failure) {
      emit(
        state.error(failure.errMessages),
      );
    });
  }
}
