import 'package:flutter/material.dart';
import 'package:loka_challenge/sauce_data.dart';
import 'package:loka_challenge/screens/homepage.dart';
import 'package:provider/provider.dart';

class ThankYou extends StatelessWidget {
  static const String id = "/thanyou";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/logo.png',
          scale: 3,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Thank you for your purchase!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<SauceData>(context, listen: false).clearData();
                Navigator.popUntil(context, ModalRoute.withName(Homepage.id));
              },
              child: Text(
                "Restart",
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
