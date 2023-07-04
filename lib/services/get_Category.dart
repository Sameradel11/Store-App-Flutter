
import "package:store/helper/api_class.dart";
import "package:store/models/product_model.dart";

class GetCategory {
  Future<List<ProductModel>> getcategory(String category) async {
    String link = "https://fakestoreapi.com/products/categories/$category";
    List<dynamic> products = await Api().getservice(link: link);
    List<ProductModel> product = [];
    for (int i = 0; i < product.length; i++) {
      product.add(ProductModel.fromjson(products[i]));
    }
    return product;
  }
}
