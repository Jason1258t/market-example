class Product {
  int productId;
  String title;
  String productDescription;
  double price;
  double rating;
  String? imageUrl; // Optional
  List<String>? images; // Optional
  int isAvailableForSale;

  Product({
    required this.productId,
    required this.title,
    required this.productDescription,
    required this.price,
    required this.rating,
    this.imageUrl,
    this.images,
    required this.isAvailableForSale,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] as int,
      title: json['title'] as String,
      productDescription: json['productDescription'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
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
