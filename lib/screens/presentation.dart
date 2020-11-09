import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:loka_challenge/sauce_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:loka_challenge/screens/homepage.dart';

class Presentation extends StatefulWidget {
  @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parseJson();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.popAndPushNamed(context, Homepage.id);
  }

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/json_file.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = await jsonDecode(jsonString);
    Provider.of<SauceData>(context, listen: false)
        .updateSauceData(jsonResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "images/logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
