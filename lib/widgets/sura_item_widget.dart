import 'package:flutter/material.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SuraItemWidget extends StatelessWidget {
  final int index;

  const SuraItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return Row(
      spacing: width * 0.04,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.suraItemFrame),
            Text('${index + 1}', style: AppStyles.bold14white),
          ],
        ),
        Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuraList[index],
              style: AppStyles.bold20white,
            ),
            Text(
              '${QuranResources.ayaNumberList[index]} Verses',
              style: AppStyles.bold14white,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranSuraList[index],
          style: AppStyles.bold20white,
        ),
      ],
    );
  }
}
