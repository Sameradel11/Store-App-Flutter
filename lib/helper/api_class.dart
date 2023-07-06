import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class Api {
  Future<dynamic> getservice({required String link, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error with status code${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> postService(
      {required link,
      required Map<String, dynamic> body,
      String? token}) async {
    http.Response response =
        await http.post(Uri.parse(link), body: body, headers: {
      "Accept": "Application/json",
      "Content-type": "application/x-www-form-urlencoded"
    });
     print(body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);

      return data;
    } else {
      throw (Exception(
          "dumbass${response.statusCode} | ${jsonDecode(response.body)}"));
    }
  }

  Future<Map<String, dynamic>> putservice(
    
      {required id,
        required link,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {};

    headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    print(body);
    http.Response response =
        await http.put(Uri.parse(link), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw (Exception(
          "dumbass${response.statusCode} |"));
    }
  }
}
