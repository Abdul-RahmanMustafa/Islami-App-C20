import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 1;

  final List<String> tasbeehWords = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: AppStyles.bold20white.copyWith(fontSize: 36),
          textAlign: TextAlign.center,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAssets.sebhaHead,
              height: height * 0.43,
              alignment: Alignment.topCenter,
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.13),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    splashColor: AppColors.TransparentColor,
                    highlightColor: AppColors.TransparentColor,
                    enableFeedback: false,
                    onTap: () {
                      setState(() {
                        if (counter == 33) {
                          index = (index + 1) % tasbeehWords.length;
                          counter = 0;
                        } else {
                          counter++;
                        }
                        angle += 1;
                      });
                    },
                    child: Transform.rotate(
                      angle: -2 * angle,
                      child: Image.asset(
                        AppAssets.sebhaBody,
                        height: height * .4,
                      ),
                    ),
                  ),
                  Column(
                    spacing: height * .02,
                    children: [
                      Text(
                        tasbeehWords[index],
                        style: AppStyles.bold20white.copyWith(fontSize: 36),
                      ),
                      Text(
                        '$counter',
                        style: AppStyles.bold20white.copyWith(fontSize: 36),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
