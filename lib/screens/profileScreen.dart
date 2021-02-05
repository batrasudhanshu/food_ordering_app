import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/homePage.dart';
import 'package:food_ordering_app/widgets/myButton.dart';
import 'package:food_ordering_app/widgets/myPasswordTextFormField.dart';
import 'package:food_ordering_app/widgets/myTextFormField.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isMale = false;
  bool isEdit = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  File image;
  Future<void> getImage({ImageSource imageSource}) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
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
      //submit();
    }
  }

  Future<void> myDialogueBox() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      child: Builder(builder: (BuildContext context) {
        return AlertDialog(
            content: SingleChildScrollView(
          child: ListBody(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: () {
                  getImage(
                    imageSource: ImageSource.camera,
                  );
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text("Gallery"),
                onTap: () {
                  getImage(
                    imageSource: ImageSource.gallery,
                  );
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));
      }),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _buildTextFormField() {
    return Container(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextFormField(
                controller: fullName,
                title: "Full Name",
              ),
              SizedBox(
                height: 10.0,
              ),
              MyTextFormField(
                controller: email,
                title: "Email",
              ),
              SizedBox(
                height: 10.0,
              ),
              MyTextFormField(
                controller: phoneNumber,
                title: "Phone Number",
              ),
              SizedBox(
                height: 10.0,
              ),
              MyTextFormField(
                controller: address,
                title: "Address",
              ),
              SizedBox(
                height: 10.0,
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
                height: 10.0,
              ),
              MyPasswordTextFormField(
                controller: password,
                title: "Password",
              ),
              SizedBox(
                height: 20,
              ),
              MyButton(
                buttonName: "Update",
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSingleContainer({String userName}) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.blueGrey[50], borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(left: 20),
      child: Text(
        userName,
        style: TextStyle(fontSize: 20, color: Colors.purple[900]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
            "Profile",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(top: 10, right: 30),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isEdit = !isEdit;
                    });
                  },
                  child: Icon(
                    isEdit == false ? Icons.edit : Icons.close,
                    color: Color.fromRGBO(212, 230, 241, 1),
                    size: 30,
                  ),
                )),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.blueGrey[800],
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  maxRadius: 70,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    maxRadius: 65,
                                    backgroundImage:
                                        AssetImage("assets/images/sud.jpg"),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      color: Colors.white,
                      child: isEdit == false
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildSingleContainer(
                                    userName: "Sudhanshu Batra"),
                                _buildSingleContainer(
                                    userName: "Sudhanshu Batra"),
                                _buildSingleContainer(
                                    userName: "Sudhanshu Batra"),
                                _buildSingleContainer(
                                    userName: "Sudhanshu Batra"),
                              ],
                            )
                          : _buildTextFormField(),
                    ),
                  ),
                ],
              ),
              isEdit == true
                  ? Positioned(
                      top: 140,
                      left: 230,
                      child: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Color.fromRGBO(212, 230, 241, 1),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.black),
                          onPressed: () {
                            myDialogueBox();
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
