import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/home.dart';
import 'package:islamy/ui/screens/splach/splach_2.dart';
import 'package:islamy/ui/utilits/assets.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});
  static const roueName = "splach";

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Splach2.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset(AppAssets.splachBackground));
  }
}
