import 'dart:async';
import 'package:flutter/material.dart';

import 'authentification.dart';
class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScren();
  }
}

class SplashScren extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Authentification())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/splash.jpeg'),
    );
  }
}