import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_food_geneva/AuthScreen.dart';
import 'package:home_food_geneva/ShopList.dart';
import 'HomePage.dart';
import 'About.dart';
import 'Contact.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Drawer(
        child: new ListView(
      children: <Widget>[
        new DrawerHeader(
          child: Text(
            "",
            style: TextStyle(fontFamily: "OpenSans", fontSize: 15),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/blur.jpg'),
            ),
          ),
        ),
        new ListTile(
          title: new Text(
            "Home",
            style: TextStyle(fontFamily: "OpenSans"),
          ),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(
                ctxt, new MaterialPageRoute(builder: (ctxt) => new HomePage()));
          },
        ),
        Divider(),
        new ListTile(
          title: new Text("SignUp or LogIn",
              style: TextStyle(fontFamily: "OpenSans")),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new AuthScreen()));
          },
        ),
        Divider(),
        new ListTile(
          title: new Text("Order", style: TextStyle(fontFamily: "OpenSans")),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new ShopListWidget()));
          },
        ),
        Divider(),
        new ListTile(
          title:
              new Text("Contact Us", style: TextStyle(fontFamily: "OpenSans")),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(
                ctxt, new MaterialPageRoute(builder: (ctxt) => new Contact()));
          },
        ),
        Divider(),
        new ListTile(
          title: new Text("About Home Food Geneva",
              style: TextStyle(fontFamily: "OpenSans")),
          onTap: () {
            Navigator.pop(ctxt);
            Navigator.push(
                ctxt, new MaterialPageRoute(builder: (ctxt) => new About()));
          },
        ),
        Divider(),
        new ListTile(
          title: new Text("Instagram Page",
              style: TextStyle(fontFamily: "OpenSans")),
          onTap: () async {
            const url =
                'https://instagram.com/homefoodgeneva?utm_medium=copy_link';

            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        Divider(),
        new ListTile(
          title: new Text("Website", style: TextStyle(fontFamily: "OpenSans")),
          onTap: () async {
            const url = 'https://homefoodgeneva.net';

            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ],
    ));
  }
}
