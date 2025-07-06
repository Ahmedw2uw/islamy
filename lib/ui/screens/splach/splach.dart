import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/home.dart';
import 'package:islamy/ui/utilits/assets.dart';

class Splach extends StatelessWidget {
  const Splach({super.key});
  static const roueName = "splach";
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Home.roueName);
    });
    return Scaffold(body: Image.asset(AppAssets.splachBackground));
  }

}
