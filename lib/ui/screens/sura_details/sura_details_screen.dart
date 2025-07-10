import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/model/sura_model.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:islamy/ui/utilits/colors.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const routeName = "SuraDetailsScreen";
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SuraModel sura; //! late becuse it initalize in run
  String suraContent =
      ""; //! contain of the text of sura bubt initalize of impty

  @override
  Widget build(BuildContext context) {
    sura =
        ModalRoute.of(context)!.settings.arguments
            as SuraModel; //! this is giv the curent route and can acces to sitting and argument and casting to suramodel
    if (suraContent.isEmpty) {
      readSuraContent(); //! if the sura empty read it
    }
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
        title: Text(
          sura.suraNameEn,
          style: AppStyles.goldBold20,
        ), //! change the color
        centerTitle: true, //! to center the title
      ),

      //! the body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(AppAssets.borderLift),
                Expanded(
                  child: Text(
                    sura.suraNameAr,
                    style: AppStyles.goldBold20,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppAssets.borderRight),
              ],
            ),
          ),

          suraContent.isEmpty
              ? Center(child: CircularProgressIndicator(color: AppColors.gold))
              : Expanded(
                //! expanded to limit the screen
                child: SingleChildScrollView(
                  //! to can be scrol
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      suraContent,
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

  //! this is a asyncronus future function
  Future readSuraContent() async {
    //* this function is execute in a eventLoop block (event loop : is an isolate blok is execute in future and stop program to execute  )
    //! this to read or catch the text
    String fileName =
        "assets/files/quran/${sura.suraIndex}.txt"; //! the suras in this shape(1.txt)and can change the index
    Future<String> contentFuture = rootBundle.loadString(fileName);
    suraContent = await contentFuture;
    List<String> suraLines = suraContent.trim().split(
      "\n",
    ); //! this is split the list to list of lines when hav ("\n"),and remove the space
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += " [${i + 1}] "; //! this to add the line index
    }
    suraContent = suraLines.join(); //! this is parse the string to list
    setState(() {}); //! before feacth the content rebild
  }
}
