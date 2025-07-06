import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/home.dart';
import 'package:islamy/ui/screens/splach/splach.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splach.roueName,
      routes: {Splach.roueName: (_) => Splach(), Home.roueName: (_) => Home()},
    );
  }
}
