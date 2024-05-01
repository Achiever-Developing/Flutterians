import 'package:exam_1/headers.dart';

class Product {
  int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  String category;
  String thumbnail;
  List<String> images;
  int qty;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.category,
    required this.thumbnail,
    required this.images,
    required this.qty,
  });

  factory Product.fromMap({required Map<String, dynamic> data}) => Product(
        id: data["id"],
        title: data["title"],
        description: data["description"],
        price: data["price"]?.toDouble(),
        discountPercentage: data["discountPercentage"]?.toDouble(),
        rating: data["rating"]?.toDouble(),
        stock: data["stock"],
        category: data["category"],
        thumbnail: data["thumbnail"],
        images: List<String>.from(data["images"].map((x) => x)),
        qty: data["qty"],
      );
}
