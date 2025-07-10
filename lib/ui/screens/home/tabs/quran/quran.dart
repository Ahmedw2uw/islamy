import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islamy/ui/screens/sura_details/sura_details_screen.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:islamy/ui/utilits/colors.dart';
import 'package:islamy/ui/utilits/constants.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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

          Expanded(child: bildSurasListView()),
        ],
      ),
    );
  }
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
        onTap: () {
          Navigator.pushNamed(
            context,
            SuraDetailsScreen.routeName,
            arguments: sura,
          ); //! go to the SuraDetailsScreen
        },
        child: SuraRow(
          sura: sura, //! to display the suras list
        ),
      );
    },
  );
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
