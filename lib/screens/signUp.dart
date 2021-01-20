import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/login.dart';
import 'package:food_ordering_app/widgets/gender.dart';
import 'package:food_ordering_app/widgets/haveAccountOrNot.dart';
import 'package:food_ordering_app/widgets/myButton.dart';
import 'package:food_ordering_app/widgets/myPasswordTextFormField.dart';
import 'package:food_ordering_app/widgets/myTextFormField.dart';
import 'package:food_ordering_app/widgets/topTitle.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  void validation() {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullName.text.isEmpty &&
        address.text.isEmpty &&
        phoneNumber.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("All fields are empty"),
      ));
    } else if (phoneNumber.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Phone Number field is empty"),
      ));
    } else if (phoneNumber.text.length < 11) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Incorrect Phone Number"),
      ));
    } else if (email.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Email field is empty"),
      ));
    } else if (fullName.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Full Name field is empty"),
      ));
    } else if (address.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Address field is empty"),
      ));
    } else if (!regExp.hasMatch(email.text)) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Email is Invalid"),
      ));
    } else if (password.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Password field is empty"),
      ));
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopTitle(
                  title: "Sign Up",
                  subTitle: "Create an Account",
                ),
                Container(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyTextFormField(
                        controller: fullName,
                        title: "Full Name",
                      ),
                      MyTextFormField(
                        controller: email,
                        title: "Email",
                      ),
                      MyTextFormField(
                        controller: phoneNumber,
                        title: "Phone Number",
                      ),
                      MyTextFormField(
                        controller: address,
                        title: "Address",
                      ),
                      Gender(),
                      MyPasswordTextFormField(
                        controller: password,
                        title: "Password",
                      ),
                    ],
                  ),
                ),
                MyButton(
                  buttonName: "Sign Up",
                  onPressed: () {},
                ),
                HaveAccountOrNot(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Login(),
                      ),
                    );
                  },
                  subTitle: "Login",
                  title: "I already have an account ",
                ),
              ],
            ),
          ),
        ));
  }
}
