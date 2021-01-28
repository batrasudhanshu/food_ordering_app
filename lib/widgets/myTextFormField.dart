import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  MyTextFormField({this.controller, this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(212, 230, 241, 1),
        filled: true,
        hintText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
