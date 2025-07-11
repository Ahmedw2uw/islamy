import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:islamy/ui/screens/home/tabs/azkar/azkar.dart';
import 'package:islamy/ui/screens/home/tabs/quran/quran.dart';
import 'package:islamy/ui/screens/home/tabs/radio/radio.dart';
import 'package:islamy/ui/screens/home/tabs/sepha/sepha.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:islamy/ui/utilits/colors.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const roueName = "home";

  @override
  State<Home> createState() => _HomeState();
}

int selectedIndex = 0; //! to know goe the index or item is selected
List<Widget> tabs = [
  QuranTab(),
  AhadethTab(),
  SephaTab(),
  AzkarTab(),
  RadioTab(),
]; //! list contain of list of tabs

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex], //! to change the curent tab
      bottomNavigationBar: bildBottomNavigationBar(),
    );
  }

  Widget bildBottomNavigationBar() {
    return BottomNavigationBar(
      //! this function bild icon navigation bar
      selectedItemColor:
          AppColors.wight, //! this to control the selected icon color
      unselectedItemColor:
          AppColors.black, //! this to control the unselected icon color
      onTap: (index) {
        selectedIndex = index;

        setState(() {}); //! هنا شغالة صح دلوقتي لأنها جوا State
      },
      currentIndex: selectedIndex, //! to change the selected icoon by index
      iconSize: 30, //! control the icon size
      selectedLabelStyle: AppStyles.wightBold12, //! control the text style
      items: [
        BottomNavigationBarItem(
          icon: bildBottomNavigationBaricon(
            AppAssets.icQuran,
            selectedIndex == 0,
          ),
          label: "quran",
        ),
        BottomNavigationBarItem(
          icon: bildBottomNavigationBaricon(
            AppAssets.icAhadeth,
            selectedIndex == 1,
          ),
          label: "ahadeth",
        ),
        BottomNavigationBarItem(
          icon: bildBottomNavigationBaricon(
            AppAssets.icSepha,
            selectedIndex == 2,
          ),
          label: "sepha",
        ),
        BottomNavigationBarItem(
          icon: bildBottomNavigationBaricon(
            AppAssets.icRadio,
            selectedIndex == 3,
          ),
          label: "radio",
        ),
        BottomNavigationBarItem(
          icon: bildBottomNavigationBaricon(
            AppAssets.icAzkar,
            selectedIndex == 4,
          ),
          label: "azkar",
        ),
      ],
    );
  }
}

Widget bildBottomNavigationBaricon(String icon, bool isSlected) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 6,
      horizontal: 20,
    ), //! to maik padding
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20), //! to maik reduse
      color:
          isSlected
              ? AppColors.blackWithOpacity60
              : Colors.transparent, //! to change the background color
    ),
    child: ImageIcon(AssetImage(icon)),
  );
}
