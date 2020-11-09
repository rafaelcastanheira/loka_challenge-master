import 'package:flutter/material.dart';
import 'package:loka_challenge/components/credit_card.dart';
import 'package:loka_challenge/sauce_data.dart';
import 'package:loka_challenge/screens/checkout.dart';
import 'package:loka_challenge/screens/product_details.dart';
import 'package:loka_challenge/screens/thankyou.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';
import 'screens/presentation.dart';
import 'sauce_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SauceData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color(0xFF0f9045),
          backgroundColor: Color(0xFFf3f3ff),
          cardColor: Colors.grey[100],
          accentColor: Colors.black54,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => Presentation(),
          "${Homepage.id}": (context) => Homepage(),
          "${ProductDetails.id}": (context) => ProductDetails(),
          "${Checkout.id}": (context) => Checkout(),
          "${CreditCard.id}": (context) => CreditCard(),
          "${ThankYou.id}": (context) => ThankYou()
        },
      ),
    );
  }
}
