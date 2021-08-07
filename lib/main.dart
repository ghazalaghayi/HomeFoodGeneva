import 'package:flutter/material.dart';
import 'package:home_food_geneva/AuthProvider.dart';
import 'package:home_food_geneva/CartProvider.dart';
import 'package:home_food_geneva/ProductsProvider.dart';
import 'package:provider/provider.dart';
import 'AppProvider.dart';
import 'SplashScreen.dart';
import 'Const.dart';
import 'AuthProvider.dart';
import 'OrdersProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (context, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
          create: (ctx) => null,
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (context, auth, previosOrders) => Orders(
            auth.token,
            auth.userId,
            previosOrders == null ? [] : previosOrders.orders,
          ),
          create: (ctx) => null,
        ),
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
