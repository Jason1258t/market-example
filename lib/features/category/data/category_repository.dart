import 'package:market/api/api_service.dart';
import 'package:market/models/category.dart';

class CategoryRepository {
  final ApiService api;

  CategoryRepository({required this.api});

  Future<List<CategoryModel>> loadCategoryList() async {
    List<CategoryModel> categoryList = [];

    return categoryList;
  }
}
