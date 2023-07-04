import 'dart:convert';

import 'package:http/http.dart' as http;

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



  Future<http.Response> postService(
      {required link,
      required Map<String, dynamic> body,
      String? token}) async {
    http.Response response =
        await http.post(Uri.parse(link), body: body, headers: {
      "Accept": "Application/json",
      "Content-type": "application/x-www-form-urlencoded"
    });
    return response;
  }



  Future<http.Response> putservice(
      {required link,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    http.Response response =
        await http.post(Uri.parse(link), body: body, headers: headers);
    return response;
  }
}
