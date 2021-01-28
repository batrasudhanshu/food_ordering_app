import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title, subTitle;
  TopTitle({this.subTitle, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(31, 97, 141, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 40.0,
              color: Color.fromRGBO(52, 73, 94, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
