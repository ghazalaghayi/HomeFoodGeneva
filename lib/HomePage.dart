import 'package:flutter/material.dart';
import 'package:home_food_geneva/ProductsOverviewScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:convert';
import 'NavigationBar.dart';
import 'Drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = <Widget>[];
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJson = jsonDecode(dataString);

      dataJson.forEach((object) {
        String finalString = "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item) {
          finalString = finalString + item;
        });

        items.add(Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            object["placeName"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "OpenSans"),
                          ),
                          Text(
                            finalString,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "OpenSans",
                              color: Colors.white,
                            ),
                            maxLines: 2,
                          ),
                          Divider(),
                          Text(
                            object["placeCommon"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontFamily: "OpenSans"),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
      });
      return items;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 15.0,
        centerTitle: true,
        title: Text(
          "Home Food Geneva",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "OpenSans",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(MdiIcons.github),
            onPressed: () async {
              const url = 'https://github.com/ghazalaghayi/HomeFoodGeneva';

              if (await canLaunch(url)) {
                await launch(url, forceSafariVC: false);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      drawer: DrawerOnly(),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BannerWidgetArea(),
                Container(
                  child: FutureBuilder(
                    initialData: <Widget>[Text("")],
                    future: createList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            children: snapshot.data,
                            primary: false,
                            shrinkWrap: true,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return ProductsOverviewScreen();
          }));
        },
        backgroundColor: Colors.red[400],
        child: Icon(
          MdiIcons.food,
          color: Colors.black,
        ),
      ),
    );
  }
}

var bannerHeads = ["Appetizer", "Main Course", "Dessert", "Breads", "Catering"];
var bannerTexts = [
  "Get the Journey Started ...",
  "Keep Enjoying the Journey ...",
  "Sweet & Happy Time ...",
  "A Unique Selection of Breads ...",
  "Enjoy an Exceptional Catering Experience ..."
];
var bannerImages = [
  "images/appetizer2.jpg",
  "images/maincourse2.jpg",
  "images/desserts.jpg",
  "images/breads2.jpg",
  "images/catering2.jpg"
];

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = <Widget>[];

    for (int x = 0; x < bannerHeads.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  bannerImages[x],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerHeads[x],
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontFamily: "OpenSans"),
                    ),
                    Text(
                      bannerTexts[x],
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontFamily: "OpenSans"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
