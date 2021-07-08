import 'package:flutter/material.dart';
import 'package:home_food_geneva/NavigationBar.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* final height = MediaQuery.of(context).size.height; */

    return Scaffold(
      body: Container(
        /*  decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/blur.jpg'), fit: BoxFit.cover)),
        height: height, */
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Introducing Home Food Geneva",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                      fontSize: 25.0,
                    ),
                  ),
                ),
                Divider(),
                Image.asset(
                  'images/introduce.jpg',
                  width: 500.0,
                  height: 250.0,
                  alignment: Alignment.topCenter,
                ),
                Divider(),
                Text(
                  "My Name is Mahshin Aalishah & \n Welcome to My Flavourful and Tasteful World :) \n"
                  "I strongly believe that FOOD is a unique way of bringing people from all walks of life together \n"
                  "& the connection resulted would last for a long time. \n"
                  "Flavours, specifically, empower this connection and feeling, like speaking in a common language, and has always been motivating me to look into cooking differently; \n"
                  "cooking with all my heart and soul and being passionate of sharing it with everyone of you ... \n"
                  "I hope you’ll enjoy viewing my works as much as I enjoyed cooking and preparing them. \n"
                  "Please go ahead, explore, and I look forward to having you all on this culinary journey with me, tasting, and discovering more and more ... \n \n"
                  "P.S. Everything has a veggie-friendly version; so don't worry at all ;)",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "OpenSans",
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
