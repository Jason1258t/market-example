import 'package:bloc/bloc.dart';
import 'package:market/features/products/data/products_repository.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductsRepository productsRepository;

  ProductDetailsCubit(this.productsRepository) : super(ProductDetailsInitial());

  Future<void> loadProductDetailsById(int id) async {
    emit(ProductDetailsLoading());
    try {
      await productsRepository.getProductDetailsById(id);
      emit(ProductDetailsSuccessl());
    } catch (e) {
      emit(ProductDetailsFailure());
    }
  }
}
