import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.ontap});
  String? text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade400,
          ),
          child: Center(
            child: Text(
              "$text",
              style: const TextStyle(color: Color(0xff2B475E), fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
