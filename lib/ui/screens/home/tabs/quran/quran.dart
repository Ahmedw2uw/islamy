import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islamy/ui/screens/sura_details/sura_details_screen.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:islamy/ui/utilits/colors.dart';
import 'package:islamy/ui/utilits/constants.dart';
import 'package:islamy/ui/utilits/most_resent_prefrunces.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    super.initState();
    MostResentSurasPrefrunces.loadSurasListFromSharedPrefrunces().then((_) {
      //! this used with the future function its equle (await) but with not future function
      setState(() {
        //! when load suras set state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover, //! to fit the screen
          image: AssetImage(AppAssets.quranBackground), //! the background
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          Image.asset(AppAssets.islamiLogo),
          bildSearchTextFeld(),
          SizedBox(height: 30),
          Text("Most Recently ", style: AppStyles.wightgoldBold16),
          SizedBox(height: 20),
          if (MostResentSurasPrefrunces
              .surasList
              .isNotEmpty) //! if not emptyh display them
            Expanded(
              flex: 3,
              child: SizedBox(height: 100, child: bildmostResentSuras()),
            ),
          Expanded(flex: 7, child: bildSurasListView()),
        ],
      ),
    );
  }

  Widget bildmostResentSuras() {
    return ListView.builder(
      itemCount:
          MostResentSurasPrefrunces
              .surasList
              .length, //! to taik the lingth from it
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var sura = MostResentSurasPrefrunces.surasList[index]; //! variable
        return Container(
          width: MediaQuery.of(context).size.width * 0.7,
          margin: EdgeInsets.symmetric(horizontal: 19),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.resentSura)),
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(18),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SuraDetailsScreen.routeName,
                arguments: sura,
              );
            },
            child: Row(
              children: [
                SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sura.suraNameEn, style: AppStyles.blackBold24),
                    Text(sura.suraNameAr, style: AppStyles.blackBold24),
                    Text("${sura.verses} verses", style: AppStyles.blackBold16),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bildSurasListView() {
    return ListView.separated(
      //! seperate the widget
      separatorBuilder:
          (_, __) => Divider(
            indent: 64, //! from start
            endIndent: 64, //! to end
          ), //! to bild divider
      itemCount: AppConstants.suras.length, //! the list count
      itemBuilder: (context, index) {
        var sura = AppConstants.suras[index]; //! this contain of sura content

        return InkWell(
          //! to maik the sura row ckichable
          onTap: () async {
            //! maik this asyncronus
            MostResentSurasPrefrunces.addSurasListToSharedPrefrunces(
              sura,
            ); //! to add the opend sura in most resent

            await Navigator.pushNamed(
              //! (await ) becuse when navegate and go back maik set state
              context,
              SuraDetailsScreen.routeName,
              arguments: sura,
            ); //! go to the SuraDetailsScreen
            setState(() {});
          },

          child: SuraRow(
            sura: sura, //! to display the suras list
          ),
        );
      },
    );
  }
}

Widget bildSearchTextFeld() {
  var defultBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.gold, width: 1),
    borderRadius: BorderRadius.circular(10),
  );
  return TextField(
    decoration: InputDecoration(
      focusedBorder: defultBorder, //! when activ it
      enabledBorder: defultBorder, //! when not activ
      labelText:
          "Sura Name", //! cange the lable but not change if you need to hidden it (hint text)
      labelStyle: AppStyles.wightgoldBold16, //! change color
      prefixIcon: ImageIcon(
        //! put icon in the first text feld
        AssetImage(AppAssets.icQuran), //! the icon
        color: AppColors.gold, //! icon color
      ),
    ),
    style: AppStyles.wightgoldBold16, //! change color,
    cursorColor: AppColors.gold, //! change the curser color
  );
}
