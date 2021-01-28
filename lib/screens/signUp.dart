import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_app/screens/homePage.dart';
import 'package:food_ordering_app/screens/login.dart';
// import 'package:food_ordering_app/widgets/gender.dart';
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
  bool isMale = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  bool isLoading = false;
  UserCredential authResult;

  void submit() async {
    setState(() {
      isLoading = false;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = "Please check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(authResult.user.uid)
        .set({
      "UserName": fullName.text,
      "UserEmail": email.text,
      "UserId": authResult.user.uid,
      "UserPhoneNo": phoneNumber.text,
      "UserAddress": address.text,
      "UserGender": isMale == true ? "Male" : "Female",
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => HomePage()),
    );
    setState(() {
      isLoading = false;
    });
  }

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
    } else {
      submit();
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _buildTextFormField() {
    return Container(
      height: 450,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextFormField(
                controller: fullName,
                title: "Full Name",
              ),
              SizedBox(
                height: 5.0,
              ),
              MyTextFormField(
                controller: email,
                title: "Email",
              ),
              SizedBox(
                height: 5.0,
              ),
              MyTextFormField(
                controller: phoneNumber,
                title: "Phone Number",
              ),
              SizedBox(
                height: 5.0,
              ),
              MyTextFormField(
                controller: address,
                title: "Address",
              ),
              SizedBox(
                height: 5.0,
              ),
              GestureDetector(
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
                    color: Color.fromRGBO(212, 230, 241, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              MyPasswordTextFormField(
                controller: password,
                title: "Password",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonPart() {
    return isLoading == false
        ? MyButton(
            buttonName: "Sign Up",
            onPressed: () {
              validation();
            },
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
            builder: (ctx) => Login(),
          ),
        );
      },
      subTitle: "Login",
      title: "I already have an account ",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopTitle(
                    title: "Sign Up",
                    subTitle: "Create an Account",
                  ),
                  _buildTextFormField(),
                  _buildButtonPart(),
                  _buildHaveAccountOrNot()
                ],
              ),
            ],
          ),
        ));
  }
}
