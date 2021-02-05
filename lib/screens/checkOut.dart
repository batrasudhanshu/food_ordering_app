import 'package:flutter/material.dart';
import 'package:food_ordering_app/widgets/myButton.dart';

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: 220,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.blueAccent[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Rs 210",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            MyButton(
              buttonName: "Order",
              onPressed: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(212, 230, 241, 1),
              size: 30,
            ),
            onPressed: () {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (ctx) => HomePage()),
              // );
            }),
        elevation: 5.0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        title: Text(
          "Check-Out",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 80,
                child: Center(
                    child: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 30,
                    backgroundImage:
                        AssetImage("assets/images/garlic_bread.jpg"),
                  ),
                  title: Row(
                    children: [
                      Text("x1"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Garlic Bread"),
                          SizedBox(
                            height: 7,
                          ),
                          Text("Prashant Vihar")
                        ],
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Rs 210",
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
