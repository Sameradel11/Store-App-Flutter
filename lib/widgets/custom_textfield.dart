import 'package:flutter/material.dart';
import 'package:store/helper/consts.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.label,
      required this.text,
      required this.onchange,
      this.inputType = TextInputType.text});
  String label;
  String text;
  TextInputType inputType;
  void Function(String) onchange;
  int counter = 0;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controllerr = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerr.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: widget.onchange,
        keyboardType: widget.inputType,
        minLines: 1,
        maxLines: 4,
        controller: controllerr,
        onTap: () => {
          if (widget.counter == 0)
            {
              controllerr.selection = TextSelection(
                  baseOffset: 0, extentOffset: widget.text.length),
              widget.counter = widget.counter + 1
            }
        },
        // initialValue: text,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          label: Text(widget.label),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Kprimary_color)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
