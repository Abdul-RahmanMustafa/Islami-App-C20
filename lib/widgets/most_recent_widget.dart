import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: height * 0.01,
      children: [
        Text('Most Recently', style: AppStyles.bold16white),
        SizedBox(
          height: height * 0.15,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Al-Anbiya', style: AppStyles.bold24black),
                        Text('الأنبياء', style: AppStyles.bold24black),
                        Text('112 Verses', style: AppStyles.bold14black),
                      ],
                    ),
                    Image.asset(AppAssets.mostRecent),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.02);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
