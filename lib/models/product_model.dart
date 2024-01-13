import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final dynamic price;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? category;

  @HiveField(5)
  final String? image;

  @HiveField(6)
  final Map<String, dynamic>? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductModel.fromJsonProduct(responseData) {
    return ProductModel(
      id: responseData['id'],
      title: responseData['title'],
      price: responseData['price'],
      description: responseData['description'],
      category: responseData['category'],
      image: responseData['image'],
      rating: responseData['rating'],
    );
  }
}
