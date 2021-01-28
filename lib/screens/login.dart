import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_app/screens/homePage.dart';
import 'package:food_ordering_app/screens/signUp.dart';
import 'package:food_ordering_app/widgets/haveAccountOrNot.dart';
import 'package:food_ordering_app/widgets/myButton.dart';
import 'package:food_ordering_app/widgets/myPasswordTextFormField.dart';
import 'package:food_ordering_app/widgets/myTextFormField.dart';
import '../widgets/topTitle.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final TextEditingController email = TextEditingController();
  bool isLoading = false;
  UserCredential authResult;

  void submit() async {
    setState(() {
      isLoading = false;
    });
    try {
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => HomePage()),
      );
    } on PlatformException catch (e) {
      String message = "Please check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

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
    } else {
      submit();
    }
  }

  final TextEditingController password = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _buildAllTextFormFields() {
    return Center(
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
    );
  }

  Widget _buildButtonPart() {
    return isLoading == false
        ? MyButton(
            buttonName: "Login",
            onPressed: validation,
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildHaveAccountOrNot() {
    return HaveAccountOrNot(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => SignUp(),
          ),
        );
      },
      subTitle: "Sign Up",
      title: "Don't have an Account ? ",
    );
  }

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
              _buildAllTextFormFields(),
              // SizedBox(height: 7),
              _buildButtonPart(),
              _buildHaveAccountOrNot()
            ],
          ),
        ),
      ),
    );
  }
}
