// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:store/models/rating_model.dart';

class ProductModel {
  String price;
  String title;
  String category;
  String description;
  Rating? rating;
  String image;
  int id;
  ProductModel(
      {required this.id,
      required this.price,
      required this.title,
      required this.category,
      required this.description,
      this.rating,
      required this.image});
  factory ProductModel.fromjson(data) {
    return ProductModel(
        id: data["id"],
        price: data["price"].toString(),
        title: data['title'],
        category: data["category"],
        description: data["description"],
        image: data["image"],
        rating: Rating.fromjson(data["rating"]));
  }
  factory ProductModel.fromjsonII(data) {
    return ProductModel(
      id: data["id"],
      price: data["price"],
      title: data['title'],
      category: data["category"],
      description: data["description"],
      image: data["image"],
    );
  }
}
