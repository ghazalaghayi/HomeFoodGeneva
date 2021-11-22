import 'package:flutter/material.dart';
import 'package:home_food_geneva/AuthScreen.dart';
import 'package:home_food_geneva/HomePage.dart';
import 'package:home_food_geneva/PhotoAlbum.dart';
import 'package:provider/provider.dart';

import 'AuthProvider.dart';

class NavigationBar extends StatefulWidget {
  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    int _page = 0;
    return Consumer<Auth>(
      builder: (context, _, __) => Container(
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
                Provider.of<Auth>(context, listen: false).token == null
                    ? Icons.person
                    : Icons.logout,
                size: 28.0,
                color: _page == 2
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.caption.color,
              ),
              onPressed: () {
                if (Provider.of<Auth>(context, listen: false).token == null) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return AuthScreen();
                  }));
                } else {
                  setState(() {
                    Provider.of<Auth>(context, listen: false).logout();
                  });
                }
              },
            ),
            SizedBox(width: 7),
          ],
        ),
      ),
    );
  }
}
