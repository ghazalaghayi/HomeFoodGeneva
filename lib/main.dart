import 'package:flutter/material.dart';
import 'package:home_food_geneva/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'AppProvider.dart';
import 'SplashScreen.dart';
import 'Const.dart';
import 'AuthProvider.dart';
import 'Code.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Code()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
      },
    );
  }
}
