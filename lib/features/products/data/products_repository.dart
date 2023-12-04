import 'package:market/api/api_service.dart';
import 'package:market/models/product.dart';

class ProductsRepository {
  final ApiService api;

  final List<ProductModel> currentProductList = [];

  late ProductModel lastOpenedProduct;

  ProductsRepository({required this.api});

  Future<void> getProductsListByCategory(int categoryId) async {
    final response = await api.product.loadProductsListByCategory(categoryId);
    currentProductList.clear();

    for (var json in response['data']) {
      currentProductList.add(ProductModel.fromJson(json));
    }
  }

  Future<void> getProductDetailsById(int productId) async {
    final response = await api.product.getProductDetailsById(productId);
    final product = ProductModel.fromJson(response['data']);
    lastOpenedProduct = product;
  }
}
