import 'package:flutter/material.dart';
import 'package:store/Pages/home_page.dart';
import 'package:store/Pages/update_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => const HomePage(),
        // UpdateProduct.id: (context) =>  UpdateProduct(),
        // UpdateProductPage.id: (context) => UpdateProductPage(

        //     ),
      },
      initialRoute: HomePage.id,
    );
  }
}
