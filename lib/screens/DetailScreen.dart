import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/homePage.dart';
import 'package:food_ordering_app/widgets/myButton.dart';

class DetailScreen extends StatelessWidget {
  Widget _buildSingleDetailText(
      {context,
      String title,
      String subsTitle,
      String trailingTitle,
      String trailingSubsTitle}) {
    return Container(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey[200])),
              Text(
                subsTitle,
                style: TextStyle(color: Colors.blueGrey[200], fontSize: 22),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(trailingTitle,
                  style: TextStyle(fontSize: 22, color: Colors.purple[900])),
              Text(
                trailingSubsTitle,
                style: TextStyle(color: Colors.blueGrey[200], fontSize: 22),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        //elevation: 5.0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey[50],

        actions: [],
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueGrey[50],
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //margin: EdgeInsets.only(top: 10),
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Garlic Bread",
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.purple[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "Prashant Vihar",
                            style: TextStyle(
                                color: Colors.blueGrey[200],
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Rs 210",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[100],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.cyan,
                                            ),
                                          ),
                                          Text(
                                            "1",
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.cyan,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.cyan,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          _buildSingleDetailText(
                              context: context,
                              title: "Weight",
                              subsTitle: "Stuffed Garlic Bread",
                              trailingTitle: "500gm",
                              trailingSubsTitle: "Cheezy Dip Inside"),
                          _buildSingleDetailText(
                              context: context,
                              title: "Weight",
                              subsTitle: "Stuffed Garlic Bread",
                              trailingTitle: "500gm",
                              trailingSubsTitle: "Cheezy Dip Inside"),
                          MyButton(
                            buttonName: "CheckOut",
                            onPressed: () {},
                          )
                        ],
                      ),
                    ))
              ],
            ),
            Positioned(
                left: 75,
                top: 20,
                child: Image(
                  height: 250,
                  width: 250,
                  image: AssetImage(
                    "assets/images/garlic_bread.jpg",
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
