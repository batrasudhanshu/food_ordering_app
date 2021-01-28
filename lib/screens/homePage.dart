import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildSingleFeature(
      {context,
      String foodImage,
      String foodTitle,
      String foodSubTitle,
      String foodRating,
      String foodPrice}) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: 190,
            width: 180,
            // color: Colors.white,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  foodTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  foodSubTitle,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: 160,
                  height: 45,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange[900]),
                      Text(
                        "$foodRating Ratings",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Rs $foodPrice",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.cyan,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          child: CircleAvatar(
            maxRadius: 55,
            backgroundImage: AssetImage("assets/images/$foodImage.jpg"),
          ),
        )
      ],
    );
  }

  Widget _buildSingleCategory({String imagePath, String name}) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 180,
          width: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 120,
                  width: 120,
                  //color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 95,
                        width: 95,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/$imagePath.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                      ),
                      Text(name,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w900))
                    ],
                  ))
            ],
          ),
        ));
  }

  Widget _buildTopPart() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 35.0,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.sort,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      }),
                  // IconButton(
                  //     icon: Icon(
                  //       Icons.notifications,
                  //       size: 35.0,
                  //       color: Colors.white,
                  //     ),
                  //     onPressed: () {})
                  IconButton(
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  height: 80,
                  //color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 40,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                maxRadius: 35,
                                backgroundImage:
                                    AssetImage("assets/images/sud.jpg"),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 280,
                              //color: Colors.green,
                              child: ListTile(
                                title: Text(
                                  "Good things come to those..",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "who eat Good Food",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
        color: Colors.blueGrey[900],
      ),
    );
  }

  Widget _buildCategorySlider() {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 250,
              child: Row(
                children: [
                  _buildSingleCategory(name: "Italian", imagePath: "pizza"),
                  _buildSingleCategory(
                      name: "South Indian", imagePath: "south_indian"),
                  _buildSingleCategory(name: "Chineese", imagePath: "chineese"),
                  _buildSingleCategory(name: "Mexican", imagePath: "mexican"),
                  _buildSingleCategory(
                      name: "Beverages", imagePath: "beverages"),
                  _buildSingleCategory(name: "Biryani", imagePath: "biryani"),
                  _buildSingleCategory(
                      name: "Japaneese", imagePath: "japaneese"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFeaturedSlider(context) {
    return Container(
        child: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 250,
            child: Row(
              children: [
                _buildSingleFeature(
                    context: context,
                    foodTitle: "Garlic Bread",
                    foodSubTitle: "Prashant Vihar",
                    foodPrice: "210",
                    foodRating: "4.6",
                    foodImage: "garlic_bread"),
                _buildSingleFeature(
                    context: context,
                    foodTitle: "Garlic Bread",
                    foodSubTitle: "Prashant Vihar",
                    foodPrice: "210",
                    foodRating: "4.6",
                    foodImage: "garlic_bread"),
                _buildSingleFeature(
                    context: context,
                    foodTitle: "Garlic Bread",
                    foodSubTitle: "Prashant Vihar",
                    foodPrice: "210",
                    foodRating: "4.6",
                    foodImage: "garlic_bread")
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildBottomPart(context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Color(0xfff2f3f4),
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.only(top: 10),
            //   width: double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Categories",
            //           style:
            //               TextStyle(fontSize: 28.0, color: Colors.brown[900])),
            //       // Text("View All",
            //       //     style: TextStyle(
            //       //         fontSize: 18.0, color: Colors.brown[900]))
            //     ],
            //   ),
            // ),
            _buildCategorySlider(),
            Container(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured",
                      style:
                          TextStyle(fontSize: 28.0, color: Colors.brown[900])),
                  Text("View All",
                      style:
                          TextStyle(fontSize: 18.0, color: Colors.brown[900]))
                ],
              ),
            ),
            _buildFeaturedSlider(context)
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/sud.jpg")),
              accountName: Text("Sudhanshu Batra"),
              accountEmail: Text("batrasudhanshu09@gmail.com"),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Color.fromRGBO(40, 55, 71, 1),
                size: 30,
              ),
              title: Text("Home",
                  style: TextStyle(
                    fontSize: 17.0,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Color.fromRGBO(40, 55, 71, 1),
                size: 30,
              ),
              title: Text("About Us",
                  style: TextStyle(
                    fontSize: 17.0,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Color.fromRGBO(40, 55, 71, 1),
                size: 30,
              ),
              title: Text("Orders",
                  style: TextStyle(
                    fontSize: 17.0,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                color: Color.fromRGBO(40, 55, 71, 1),
                size: 30,
              ),
              title: Text("Contact Us",
                  style: TextStyle(
                    fontSize: 17.0,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Color.fromRGBO(40, 55, 71, 1),
                size: 30,
              ),
              title: Text("Sign Out",
                  style: TextStyle(
                    fontSize: 17.0,
                  )),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          _buildTopPart(),
          _buildBottomPart(context),
        ],
      )),
    );
  }
}
