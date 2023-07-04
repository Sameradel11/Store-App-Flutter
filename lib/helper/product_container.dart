import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';

import '../Pages/details_page.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(10, 0))
        ]),
        child: GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductDetails(productModel: product);
          })),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 18),
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$" + product.price.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red.withOpacity(0.8),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 78,
        right: 10,
        left: 75,
        child: Image.network(
          product.image,
          width: 100,
          height: 100,
        ),
      ),
    ]);
  }
}
