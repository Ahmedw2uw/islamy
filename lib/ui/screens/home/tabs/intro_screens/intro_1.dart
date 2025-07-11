import 'package:flutter/material.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:islamy/ui/utilits/colors.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});
  static const routeName = "intro_1";

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  PageController controller = PageController();
  int currentIndex = 0;

  List<Widget> pages = [
    buildPage(
      AppAssets.islamiLogo,
      AppAssets.welcomeAr,
      "Welcome To Islami App",
    ),
    buildPage(
      AppAssets.islamiLogo,
      AppAssets.gamee,
      "Welcome To Islami",
      "We Are Very Excited To Have You In Our Community",
    ),
    buildPage(
      AppAssets.islamiLogo,
      AppAssets.readQuran,
      "Reading the Quran",
      "Read, and your Lord is the Most Generous",
    ),
    buildPage(
      AppAssets.islamiLogo,
      AppAssets.doaa,
      "Bearish",
      "Praise the name of your Lord, the Most High",
    ),
    buildPage(
      AppAssets.islamiLogo,
      AppAssets.spekar,
      "Holy Quran Radio",
      "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  static Widget buildPage(
    String logo,
    String image,
    String text, [
    String? anotherText = "",
  ]) {
    return Column(
      children: [
        Expanded(flex: 2, child: Image.asset(logo)),
        Expanded(flex: 6, child: Image.asset(image)),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppStyles.goldBold20,
                textAlign: TextAlign.center,
              ),
              if (anotherText != null && anotherText.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    anotherText,
                    style: AppStyles.goldBold20,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) => pages[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back
                if (currentIndex > 0)
                  TextButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("Back", style: AppStyles.goldBold20),
                  )
                else
                  SizedBox(width: 60), // space reservation
                // Dots
                Row(
                  children: List.generate(
                    pages.length,
                    (index) => buildDot(index == currentIndex),
                  ),
                ),

                // Next or Start
                TextButton(
                  onPressed: () {
                    if (currentIndex < pages.length - 1) {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, "home");
                    }
                  },
                  child: Text(
                    currentIndex < pages.length - 1 ? "Next" : "Start",
                    style: AppStyles.goldBold20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
