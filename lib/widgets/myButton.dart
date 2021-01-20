import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final Function onPressed;

  MyButton({this.buttonName, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(buttonName,
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        onPressed: onPressed,
      ),
    );
  }
}
