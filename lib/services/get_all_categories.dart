

import '../helper/api_class.dart';

class GetCategoriesService {
  Future<List<dynamic>> getcategories() async {
    String link = "https://fakestoreapi.com/products/categories";
    List<dynamic> categories = await Api().getservice(link: link);
    return categories;

    
  }
}
