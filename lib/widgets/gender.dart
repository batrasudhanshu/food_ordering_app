import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool isMale = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = !isMale;
        });
      },
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          isMale == false ? "Female" : "Male",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xfff5d8e4),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
