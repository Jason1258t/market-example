part of "api_service.dart";

class Category {
  final Dio dio_;

  Category({required this.dio_});

  Future<Map<String, dynamic>> getCategoryList() async {
    final data = await dio_.get(ApiEndpoints.category);
    return data.data;
  }
}
