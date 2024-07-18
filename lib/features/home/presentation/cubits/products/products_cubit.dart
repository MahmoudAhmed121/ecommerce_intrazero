import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit(this._productRepo) : super(ProductState.initial);

  final ProductRepo _productRepo;

  Future<void> getPagenationProducts() async {
    emit(state.loading());

    final response = await _productRepo.getProducts(
      limit: 10,
      skip: state.products!.length,
      select: "title,price,thumbnail",
    );

    response.when(success: (data) {
      final updatedProducts = List<ProductResponseModel>.from(state.products!)
        ..addAll(data.products);
      emit(
        state.success(updatedProducts, data.total),
      );
    }, failure: (message) {
      emit(
        state.copyWith(errorMessage: message.errMessages),
      );
    });
  }
}
