import 'package:flutter/material.dart';

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
          child: Column(
            children: [
              Container(
                height: 200,
                width: 400,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Welcome Back !",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 400,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          fillColor: Color(0xfff5d8e4),
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xfff5d8e4),
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 400,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Theme.of(context).primaryColor,
                    child: Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    onPressed: () {
                      validation();
                    }),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ?",
                      style: TextStyle(color: Colors.black, fontSize: 18.0)),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.pink, fontSize: 20.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
