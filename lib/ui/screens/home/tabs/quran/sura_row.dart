import 'package:flutter/material.dart';
import 'package:islamy/model/sura_model.dart';
import 'package:islamy/ui/utilits/assets.dart';
import 'package:islamy/ui/utilits/text_styles.dart';

class SuraRow extends StatelessWidget {
  final SuraModel sura;
  const SuraRow({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        bildIndexImage(),
        SizedBox(width: 24),
        Expanded(
          child: bildEnInfo(),
        ), //! this in expanded to taik the remmind space in row
        bildArName(),
      ],
    );
  }

  Widget bildIndexImage() => Container(
    //! used it to bild the index and background
    width: 52,
    height: 52,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppAssets.indexBackground),
      ), //!background
    ),
    child: Center(
      child: Text(
        sura.suraIndex.toString(),
        style: AppStyles.wightBold14,
      ), //! the index of sura and bold text
    ),
  );

  Widget bildEnInfo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(sura.suraNameEn, style: AppStyles.wightBold20),
      SizedBox(height: 4),
      Text("${sura.verses} Verses", style: AppStyles.wightBold12),
    ],
  );

  Widget bildArName() => Text(sura.suraNameAr, style: AppStyles.wightBold20);
}
