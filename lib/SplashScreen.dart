import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'AuthProvider.dart';
import 'Const.dart';
import 'WalkThrough.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    return Timer(Duration(seconds: 5), changeScreen);
  }

  changeScreen() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Walkthrough();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Auth>(context, listen: false).tryAutoLogin();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        /*  decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/start.jpg'),
          ),
        ), */
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fastfood,
                size: 150.0,
                color: Theme.of(context).accentColor,
              ),
              /*  Text(
                Constants.appName,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ), */
              SizedBox(width: 40.0),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: Text("${Constants.appName}",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).accentColor,
                          fontFamily: "OpenSans")))
            ],
          ),
        ),
      ),
    );
  }
}
