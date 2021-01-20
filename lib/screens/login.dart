import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/signUp.dart';
import 'package:food_ordering_app/widgets/haveAccountOrNot.dart';
import 'package:food_ordering_app/widgets/myButton.dart';
import 'package:food_ordering_app/widgets/myPasswordTextFormField.dart';
import 'package:food_ordering_app/widgets/myTextFormField.dart';
import '../widgets/topTitle.dart';

class Login extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  void validation() {
    if (email.text.isEmpty && password.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Both fields are empty"),
      ));
    } else if (email.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Email field is empty"),
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

  final TextEditingController password = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TopTitle(subTitle: "Welcome Back !", title: "Login"),
              Center(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextFormField(
                        controller: email,
                        title: "Email",
                      ),
                      SizedBox(height: 20.0),
                      MyPasswordTextFormField(
                        controller: password,
                        title: "Password",
                      )
                    ],
                  ),
                ),
              ),
              MyButton(
                buttonName: "Login",
                onPressed: validation,
              ),
              SizedBox(height: 10),
              HaveAccountOrNot(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => SignUp(),
                    ),
                  );
                },
                subTitle: "Sign Up",
                title: "Don't have an Account ? ",
              )
            ],
          ),
        ),
      ),
    );
  }
}
