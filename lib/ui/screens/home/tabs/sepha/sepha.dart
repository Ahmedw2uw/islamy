import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class SephaTab extends StatefulWidget {
  const   SephaTab({super.key});

  @override
  State<SephaTab> createState() => _SephaTabState();
}

class _SephaTabState extends State<SephaTab>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  int currentZekrIndex = 0;
  double angle = 0;

  List<String> azkar = [
    " سُبْحَانَ ٱللّٰه ",
    " ٱلْـحَمْدُ لِلّٰه ",
    " لَا إِلَهَ إِلَّا ٱللّٰه ",
    " ٱللّٰهُ أَكْبَر ",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sephaBack),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(AppAssets.islamiLogo, height: 60),
          ),

          Expanded(
            flex: 3,
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: AppStyles.wightBold30,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            flex: 7,
            child: GestureDetector(
              onTap: _onTapTasbeeh,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //! sebha rotation
                    Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        AppAssets.sebha,
                        width: 250,
                        height: 250,
                      ),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          azkar[currentZekrIndex],
                          style: AppStyles.wightBold24.copyWith(fontSize: 22),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "$counter",
                          style: AppStyles.wightBold24.copyWith(fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void _onTapTasbeeh() {
    setState(() {
      counter++;
      angle += pi / 15;

      if (counter >= 33) {
        counter = 0;
        currentZekrIndex = (currentZekrIndex + 1) % azkar.length;
      }
    });
  }
}
