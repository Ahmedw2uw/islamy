import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/tabs/ahadeth/hadeth.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:islamy/ui/utilits/colors.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class HadethDetails extends StatefulWidget {
  static const routeName = "hadethDetailsScreen";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late Hadeth hadeth; //! late becuse it initalize in run

  @override
  Widget build(BuildContext context) {
    hadeth =
        ModalRoute.of(context)!.settings.arguments
            as Hadeth; //! this is giv the curent route and can acces to sitting and argument and casting to suramodel

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // ! to be shafaf
        leading: InkWell(
          //! to maik the icon to be click and pop (go back)
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColors.gold),
        ), //! maik icon and change the color
      ),

      //! the body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Image.asset(AppAssets.borderLift)),
              Text(hadeth.title, style: AppStyles.goldBold20),
              Expanded(child: Image.asset(AppAssets.borderRight)),
            ],
          ), //! change the color
          hadeth.hadethContent.isEmpty
              ? Center(child: CircularProgressIndicator(color: AppColors.gold))
              : Expanded(
                //! expanded to limit the screen
                child: SingleChildScrollView(
                  //! to can be scrol
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      hadeth.hadethContent,
                      style: AppStyles.goldBold24,
                      textAlign: TextAlign.center,
                      textDirection:
                          TextDirection
                              .rtl, //! to directionn the text to tight to left
                    ),
                  ),
                ),
              ), //! display the sura content

          Image.asset(
            AppAssets.bottomBackground,
          ), //! to maik the bottom background
        ],
      ),
    );
  }
}
