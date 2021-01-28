import 'package:flutter/material.dart';

class HaveAccountOrNot extends StatelessWidget {
  final String title, subTitle;
  final Function onTap;
  HaveAccountOrNot({this.onTap, this.subTitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.black, fontSize: 18.0)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTitle,
            style: TextStyle(
                color: Color.fromRGBO(31, 97, 141, 1), fontSize: 20.0),
          ),
        )
      ],
    );
  }
}
