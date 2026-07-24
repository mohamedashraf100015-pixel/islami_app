import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/model/quran_resources.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_styles.dart';

class SuraWidget extends StatelessWidget {
  final int index;
  const SuraWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Row(
      spacing:width*0.04 ,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            SvgPicture.asset(AppAssets.suraNumIcon),
            Text('${index + 1}', style: AppStyles.bold16White),
          ],
        ),
        Column(
          spacing: height*0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuraList[index],
              style: AppStyles.bold20White,
            ),
            Text(
             '${ QuranResources.ayaNumberList[index] } Verses',
              style: AppStyles.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranSuraList[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
