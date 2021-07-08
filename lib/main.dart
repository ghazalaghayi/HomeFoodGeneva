import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_food_geneva/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'AppProvider.dart';
import 'Const.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (BuildContext context, AppProvider appProvider, Widget child) {
      return MaterialApp(
        key: appProvider.key,
        debugShowCheckedModeBanner: false,
        navigatorKey: appProvider.navigatorKey,
        title: Constants.appName,
        theme: appProvider.theme,
        darkTheme: Constants.darkTheme,
        home: SplashScreen(),
      );
    });
  }
}
