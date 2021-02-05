import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:food_ordering_app/screens/login.dart';
import 'package:food_ordering_app/widgets/myButton.dart';

class SkipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Carousel(
              animationDuration: Duration(seconds: 3),
              autoplay: true,
              boxFit: BoxFit.cover,
              dotBgColor: Colors.transparent,
              dotIncreasedColor: Colors.black,
              dotSize: 10,
              images: [
                AssetImage("assets/images/skip_screen1.jpeg"),
                AssetImage("assets/images/skip_screen2.jpg"),
                AssetImage("assets/images/skip_screen3.jpeg")
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MyButton(
                  buttonName: "Skip",
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => Login()),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
