import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Pages/details_page.dart';
import 'package:store/helper/consts.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_textfield.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = "updateproduct";
  UpdateProductPage({super.key, required this.productdetails});
  ProductModel productdetails;

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? ptitle;
  String? pprice;
  String? pdefatils;
  bool isloading = false;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   title = widget.productdetails.title;
  //   price = widget.productdetails.price;
  //   defatils = widget.productdetails.description;
  // }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(
            child: Text(
              "Update Product",
              style: TextStyle(color: Kprimary_color),
            ),
          ),
        ),
        body: ListView(children: [
          Image.network(
            widget.productdetails.image,
            height: 200,
          ),
          CustomTextField(
            onchange: (data) {
              ptitle = data;
            },
            label: "Title",
            text: widget.productdetails.title,
          ),
          CustomTextField(
            onchange: (data) {
              pdefatils = data;
            },
            label: "Details",
            text: widget.productdetails.description,
          ),
          CustomTextField(
            onchange: (data) {
              pprice = data;
            },
            label: "Price",
            text: widget.productdetails.price.toString(),
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 60),
          CustomButton(
              text: "Update",
              ontap: () async {
                isloading = true;
                setState(() {});
                try {
                  await updateproduct(widget.productdetails);
                  print("sucess");
                } catch (e) {
                  print(e.toString());
                }
                isloading = false;
                setState(() {});
              })
        ]),
      ),
    );
  }

  Future<void> updateproduct(ProductModel productdetails) async {
    isloading = true;
    setstate() {}
    ;
    print("passed");
    await UpdateProductService().updateproduct(
        id: productdetails.id,
        title: ptitle == null ? productdetails.title : ptitle as String,
        price:
            pprice == null ? productdetails.price : pprice as String,
        desc: pdefatils == null
            ? productdetails.description
            : pdefatils as String,
        category: widget.productdetails.category,
        image: productdetails.image);
  }
}
