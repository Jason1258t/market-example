part of "api_service.dart";

class Product {
  final Dio dio_;

  Product({required this.dio_});

  Future<Map<String, dynamic>> loadProductsListByCategory(
      int categoryId) async {
    final response = await dio_
        .get(ApiEndpoints.product, queryParameters: {"categoryId": categoryId});
    return response.data;
  }

  Future<Map<String, dynamic>> getProductDetailsById(int productId) async {
    final response =
        await dio_.get(ApiEndpoints.productDetails, queryParameters: {
      "productId": productId,
    });

    return response.data;
  }
}
