
import 'package:store/helper/api_class.dart';
import 'package:store/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getProduct() async {
    String link = "https://fakestoreapi.com/products";
    List<dynamic> products = await Api().getservice(link: link);
    List<ProductModel> productdetails = [];
    for (int i = 0; i < products.length; i++) {
      productdetails.add(
        ProductModel.fromjson(products[i]),
      );
    }
    return productdetails;
  }
}
