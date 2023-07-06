import 'package:flutter/material.dart';
import 'package:store/helper/consts.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_products.dart';

import '../widgets/product_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Kprimary_color,
              ),
              Text(
                "New Trend",
                style: TextStyle(fontSize: 18, color: Kprimary_color),
              ),
              Icon(
                Icons.shopping_cart,
                color: Kprimary_color,
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
          child: FutureBuilder<List<ProductModel>>(
              future: GetAllProductsService().getProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel>? products = snapshot.data;

                  return GridView.builder(
                      itemCount: products!.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.1,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 5),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: products[index],
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
