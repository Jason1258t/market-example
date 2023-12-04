class ProductModel {
  int productId;
  String title;
  String productDescription;
  double price;
  double rating;
  String? imageUrl; // Optional
  List<String>? images; // Optional
  int isAvailableForSale;

  ProductModel({
    required this.productId,
    required this.title,
    required this.productDescription,
    required this.price,
    required this.rating,
    this.imageUrl,
    this.images,
    required this.isAvailableForSale,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      title: json['title'] ?? "Title",
      productDescription: json['productDescription'] ?? "Descr",
      price: (json['price'] ?? 0.0).toDouble(),
      rating: (json['rating'] ?? 0.0).toDouble(),
      imageUrl: json['imageUrl'] ?? "https://i.pinimg.com/474x/11/97/6a/11976a181a7bebdf761e009173015248.jpg",
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isAvailableForSale: json['isAvailableForSale'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'productDescription': productDescription,
      'price': price,
      'rating': rating,
      'imageUrl': imageUrl,
      'images': images,
      'isAvailableForSale': isAvailableForSale,
    };
  }
}
