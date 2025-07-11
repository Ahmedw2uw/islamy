import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/home.dart';
import 'package:islamy/ui/screens/home/tabs/intro_screens/intro_1.dart';
import 'package:islamy/ui/utilits/assets.dart';

class Splach2 extends StatefulWidget {
  const Splach2({super.key});
  static const routeName = "splach2";

  @override
  State<Splach2> createState() => _Splach2State();
}

class _Splach2State extends State<Splach2> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Intro1.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppAssets.splachScreen, fit: BoxFit.fill),
    );
  }
}
