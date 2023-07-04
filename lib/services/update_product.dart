import 'dart:convert';

import 'package:store/helper/api_class.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;

class UpdateProduct {
  Future<ProductModel> updateproduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    http.Response response = await Api()
        .postService(link: "https://fakestoreapi.com/products", body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,
    }, );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return ProductModel.fromjson(data);
    } else {
      throw (Exception("dumbass${response.statusCode} | ${jsonDecode(response.body)}"));
    }
  }
}
