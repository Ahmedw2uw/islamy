import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islamy/ui/screens/home/tabs/ahadeth/hadeth.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Hadeth> ahadeth = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadAhadeth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.ahadethBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiLogo),

          if (ahadeth
              .isNotEmpty) //! if this is true (ahadeth list not impty) bild thair
            Expanded(
              child: CarouselSlider.builder(
                itemCount: ahadeth.length,
                options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: true,

                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                  scrollDirection: Axis.horizontal,
                  height: double.infinity,
                  enlargeFactor: .2,
                ),
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) {
                  return bildHadethWidget(itemIndex);
                },
              ),
            ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  //! function to bild hadeth widget
  Widget bildHadethWidget(int itemIndex) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetails.routeName,
          arguments: ahadeth[itemIndex],
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.hadethBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ahadeth[itemIndex].title,
              style: AppStyles.blackBold24,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Text(
                ahadeth[itemIndex].hadethContent,
                style: AppStyles.blackBold16,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //! function to bild the hadeth
  Future<void> loadAhadeth() async {
    for (int i = 1; i <= 50; i++) {
      //! loop of 50 file
      String path = "assets/files/hadeth/h$i.txt"; //! load path of hadeth
      String content = await rootBundle.loadString(
        path,
      ); //! load the hadeth content
      List<String> lines = content.trim().split(
        '\n',
      ); //! divide hadeth as lines

      if (lines.isNotEmpty) {
        //! chik if not empty
        String title = lines[0].trim(); //! taik the title of hadeth
        String body =
            lines.sublist(1).join('\n').trim(); //! taik the hadeth boody

        ahadeth.add(
          Hadeth(title: title, hadethContent: body),
        ); //! finaly add the value to hadeth data model
      }
    }

    setState(() {
      isLoading = false; //! this to re bil d hadeth
    });
  }
}
