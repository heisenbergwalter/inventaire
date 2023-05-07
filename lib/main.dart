import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inventaire/logintest.dart';
import 'package:inventaire/splash.dart';


void main() {
  runApp(maine());
}

class maine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}




