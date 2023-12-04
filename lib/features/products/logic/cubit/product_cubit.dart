import 'package:bloc/bloc.dart';
import 'package:market/features/products/data/products_repository.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepository productsRepository;

  ProductCubit(this.productsRepository) : super(ProductInitial());

  Future<void> loadProductsList(int categoryId) async {
    emit(ProductLoading());

    try {
      await productsRepository.getProductsListByCategory(categoryId);
      emit(ProductSuccess());
    } catch (e) {
      print(e);
      emit(ProductFailure());
    }
  }
}
