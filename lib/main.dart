import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islamy/ui/screens/home/home.dart';
import 'package:islamy/ui/screens/splach/splach.dart';
import 'package:islamy/ui/screens/sura_details/sura_details_screen.dart';
import 'package:islamy/ui/utilits/colors.dart';
import 'package:islamy/ui/utilits/constants.dart';

void main() {
  AppConstants.fillSuras(); //! we invoke it to fill the suras list at just one time
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //! to fix the buttom navigation bar
      theme: ThemeData(
        canvasColor: AppColors.gold,
      ), //* hent(heer we change all canvas color to all buttomnavigation )
      initialRoute: Splach.roueName,
      debugShowCheckedModeBanner: false, //! to remove the debug line
      routes: {
        Splach.roueName: (_) => Splach(),
        Home.roueName: (_) => Home(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetails.routeName: (_) => HadethDetails(),
      },
    );
  }
}
