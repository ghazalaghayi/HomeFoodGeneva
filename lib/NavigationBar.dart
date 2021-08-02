import 'package:flutter/material.dart';
import 'package:home_food_geneva/AuthScreen.dart';
import 'package:home_food_geneva/HomePage.dart';
import 'package:home_food_geneva/PhotoAlbum.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _page = 0;

    return Container(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 7),
          IconButton(
            icon: Icon(
              Icons.home,
              size: 28.0,
            ),
            color: _page == 0
                ? Theme.of(context).accentColor
                : Theme.of(context).textTheme.caption.color,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return HomePage();
              }));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.photo_library,
              size: 28.0,
            ),
            color: _page == 1
                ? Theme.of(context).accentColor
                : Theme.of(context).textTheme.caption.color,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return CarouselPage();
              }));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 28.0,
              color: _page == 2
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.caption.color,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return AuthScreen();
              }));
            },
          ),
          SizedBox(width: 7),
        ],
      ),
    );
  }
}
