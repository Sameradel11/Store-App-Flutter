import 'dart:convert';

import 'package:store/helper/api_class.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;

class AddProduct {
  Future<ProductModel> addproduct(
      {required String title,
      required int id,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().putservice(
      link: "https://fakestoreapi.com/products/",
      body: {
        "title": title,
        "price": price,
        "description": desc,
        "image": image,
        "category": category,
      },
      id: null,
    );
    return ProductModel.fromjson(data);
  }
}
