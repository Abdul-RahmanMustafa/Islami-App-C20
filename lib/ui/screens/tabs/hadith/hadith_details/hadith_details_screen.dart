import 'package:flutter/material.dart';
import 'package:islami_app/model/hadith_details_args.dart';
import 'package:islami_app/ui/screens/tabs/hadith/widget/hadith_text_widget.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class HadithDetailsScreen extends StatelessWidget {
  HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var args = ModalRoute.of(context)?.settings.arguments as HadithDetailsArgs;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        centerTitle: true,
        title: Text('Hadith ${args.index}', style: AppStyles.bold20primary),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.SuraBG)),
        ),
        child: Column(
          spacing: height * 0.02,
          children: [
            SizedBox(height: height * .01),
            HadithTextWidget(
              text: args.hadith!.title,
              textStyle: AppStyles.bold24primary,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: HadithTextWidget(
                    text: args.hadith!.content,
                    textStyle: AppStyles.bold20primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}
