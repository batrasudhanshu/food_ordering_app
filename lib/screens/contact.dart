import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/homePage.dart';
import 'package:food_ordering_app/widgets/myButton.dart';
import 'package:food_ordering_app/widgets/myTextFormField.dart';

class Contact extends StatefulWidget {
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController message = TextEditingController();
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  void validation() {
    if (email.text.isEmpty && fullName.text.isEmpty && message.text.isEmpty) {
      scaffold.currentState.showSnackBar(SnackBar(
        content: Text("All fields are empty"),
      ));
    } else if (fullName.text.isEmpty) {
      scaffold.currentState.showSnackBar(SnackBar(
        content: Text("Enter your Name"),
      ));
    } else if (email.text.isEmpty) {
      scaffold.currentState.showSnackBar(SnackBar(
        content: Text("Enter your Email Address"),
      ));
    } else if (!Contact.regExp.hasMatch(email.text)) {
      scaffold.currentState.showSnackBar(SnackBar(
        content: Text("Email is Invalid"),
      ));
    } else if (message.text.isEmpty) {
      scaffold.currentState.showSnackBar(SnackBar(
        content: Text("Enter your Message"),
      ));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(212, 230, 241, 1),
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()),
              );
            }),
        elevation: 5.0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        title: Text(
          "Contact Us",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text("We are here to help you!",
                          style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              color: Colors.blueGrey[800])),
                      SizedBox(height: 30),
                      MyTextFormField(
                        title: "Full Name",
                        controller: fullName,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        title: "Email",
                        controller: email,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        title: "Message",
                        controller: message,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      MyButton(
                        buttonName: "Send",
                        onPressed: () {
                          validation();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
