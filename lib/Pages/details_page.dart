import 'package:flutter/material.dart';
import 'package:store/helper/consts.dart';
import 'package:store/helper/rating_bar.dart';
import 'package:store/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  static String id = "upp";
  ProductModel productModel;
  ProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 15,
        backgroundColor: Kprimary_color,
        onPressed: () {},
        foregroundColor: Colors.white,
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              productModel.title,
              style: const TextStyle(fontSize: 18),
            ),
            Image.network(
              productModel.image,
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Descrpition",
              style: TextStyle(
                  fontSize: 25,
                  color: Kprimary_color,
                  fontStyle: FontStyle.italic),
            ),
            Text(
              productModel.description,
              style: const TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      r"$$",
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 21),
                    ),
                    const Text(
                      "  ",
                      style: TextStyle(fontSize: 21),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  productModel.price.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBarI(rate: productModel.rating!.rate),
                Text(
                  "( ${productModel.rating!.rate})",
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
