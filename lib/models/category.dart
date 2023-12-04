class CategoryModel {
  int categoryId;
  String title;
  String imageUrl;
  int hasSubcategories;
  String fullName;
  String categoryDescription;

  CategoryModel({
    required this.categoryId,
    required this.title,
    required this.imageUrl,
    required this.hasSubcategories,
    required this.fullName,
    required this.categoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      hasSubcategories: json['hasSubcategories'] as int,
      fullName: json['fullName'] as String,
      categoryDescription: json['categoryDescription'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'title': title,
      'imageUrl': imageUrl,
      'hasSubcategories': hasSubcategories,
      'fullName': fullName,
      'categoryDescription': categoryDescription,
    };
  }
}
