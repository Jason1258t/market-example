import 'package:market/api/api_service.dart';
import 'package:market/models/category.dart';

class CategoryRepository {
  final ApiService api;
  List<CategoryModel> categoryList = [];

  CategoryRepository({required this.api});



  Future<List<CategoryModel>> loadCategoryList() async {
    final response = await api.category.getCategoryList();

    categoryList.clear();

    for (var json in response['data']['categories']) {
      categoryList.add(CategoryModel.fromJson(json));
    }

    return categoryList;
  }
}
