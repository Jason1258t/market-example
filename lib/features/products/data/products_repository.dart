import 'package:market/api/api_service.dart';

class ProductsRepository {
  final ApiService api;

  ProductsRepository({required this.api});

  Future<List> getProductsList() async {
    return [];
  }
}
