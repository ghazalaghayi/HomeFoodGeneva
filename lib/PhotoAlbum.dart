import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:home_food_geneva/NavigationBar.dart';

class CarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageCarousel(),
      bottomNavigationBar: NavigationBar(),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Carousel(
          boxFit: BoxFit.fill,
          images: [
            AssetImage('images/carousel1.jpg'),
            /*  AssetImage('images/carousel2.jpg'), */
            /*  AssetImage('images/carousel3.jpg'), */
            /*  AssetImage('images/carousel4.jpg'), */
            AssetImage('images/carousel5.jpg'),
            /*  AssetImage('images/carousel6.jpg'),
        AssetImage('images/carousel7.jpg'), */
            AssetImage('images/carousel8.jpg'),
            AssetImage('images/carousel9.jpg'),
            AssetImage('images/carousel10.jpg'),
            /*  AssetImage('images/carousel11.jpg'), */
            /*  AssetImage('images/carousel12.jpg'), */
            AssetImage('images/carousel13.jpg'),
            AssetImage('images/carousel14.jpg'),
            /*  AssetImage('images/carousel15.jpg'), */
            AssetImage('images/carousel16.jpg'),
            /*  AssetImage('images/carousel17.jpg'), */
            AssetImage('images/carousel18.jpg'),
            /*  AssetImage('images/carousel19.jpg'),
        AssetImage('images/carousel20.jpg'), */
            AssetImage('images/carousel21.jpg'),
            /*  AssetImage('images/carousel22.jpg'), */
            AssetImage('images/carousel23.jpg'),
            AssetImage('images/carousel24.jpg'),
            /*  AssetImage('images/carousel25.jpg'), */
            /*  AssetImage('images/carousel26.jpg'), */
            /*  AssetImage('images/carousel27.jpg'), */
          ],
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 3000),
        ));
  }
}
