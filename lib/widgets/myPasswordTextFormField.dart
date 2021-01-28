import 'package:flutter/material.dart';

class MyPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String title;

  MyPasswordTextFormField({this.controller, this.title});
  @override
  _MyPasswordTextFormFieldState createState() =>
      _MyPasswordTextFormFieldState();
}

class _MyPasswordTextFormFieldState extends State<MyPasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
                obscureText == true ? Icons.visibility : Icons.visibility_off)),
        fillColor: Color.fromRGBO(212, 230, 241, 1),
        filled: true,
        hintText: widget.title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
