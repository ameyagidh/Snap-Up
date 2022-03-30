import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
import './screens/sellers_screen.dart';
import './screens/products_screen.dart';
import './screens/product_details_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Snap UP',
      debugShowCheckedModeBanner: false,// removes debugging sign
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),//const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        // route to seller screen.
        SellersScreen.routeName: (_)=>const SellersScreen(),
        ProductScreen.routeName: (_)=>const ProductScreen(),
        product_details_screen.routeName: (_)=>const ProductScreen(),
      },
    );
  }
}
