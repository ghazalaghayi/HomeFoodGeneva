import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';
import 'package:home_food_geneva/NavigationBar.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/blur.jpg'), fit: BoxFit.cover)),
        height: height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 80, 10, 80),
          child: ContactUs(
            logo: AssetImage('images/start.jpg'),
            email: 'ma.aalishah@gmail.com',
            companyName: 'Home Food Geneva',
            phoneNumber: '+41795250610',
            website: 'https://homefoodgeneva.net',
            cardColor: Colors.red[300],
            textColor: Colors.black,
            companyColor: Colors.white,
            taglineColor: Colors.black,
            /*  instagramUserName: '_abhishek_doshi', */
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
