import 'dart:convert';

import 'package:store/helper/api_class.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;

class UpdateProductService {
  Future<ProductModel> updateproduct(
      {required String title,
      required String price,
      required String desc,
      required int id,
      String? image,
      String? category}) async {
    Map<String, dynamic> data = await Api().putservice(
      id: id,
      link: "https://fakestoreapi.com/products/$id",
      body: {
        
        "title": title,
        "price": price,
        "description": desc,
        "image": image,
        "category": category,
      },
    );
    return ProductModel.fromjsonII(data);
  }
}
