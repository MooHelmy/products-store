import 'package:flutter/material.dart';

class Custom_text extends StatelessWidget {
  Custom_text(
      {required this.hinte,
      this.onchange,
      this.obscureText = false,
       this.textInputType=TextInputType.text,
      });
  String? hinte;
  bool obscureText;
  Function(String)? onchange;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: textInputType,
      onChanged: onchange,
      decoration: InputDecoration(
          hintText: hinte,
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                BorderSide(color: Colors.pink, style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.pink,
            style: BorderStyle.solid,
          ))),
    );
  }
}
