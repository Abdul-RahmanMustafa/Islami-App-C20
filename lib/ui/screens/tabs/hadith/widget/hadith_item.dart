import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadith.dart';
import 'package:islami_app/model/hadith_details_args.dart';
import 'package:islami_app/ui/screens/tabs/hadith/widget/hadith_text_widget.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class HadithItem extends StatefulWidget {
  int index;

  HadithItem({super.key, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  Hadith? hadith;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return hadith == null
        ? Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          )
        : InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.hadithDetailsRouteName,
                arguments: HadithDetailsArgs(
                  hadith: hadith,
                  index: widget.index,
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: height * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor,
                image: DecorationImage(
                  image: AssetImage(AppAssets.hadithCardBG),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.01,
                    ),
                    child: Stack(
                      alignment: AlignmentGeometry.center,
                      children: [
                        HadithTextWidget(
                          text: hadith?.title ?? '',
                          textStyle: AppStyles.bold24black.copyWith(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppAssets.hadithLeftCorner),
                            Image.asset(AppAssets.hadithRightCorner),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: HadithTextWidget(
                          text: hadith?.content ?? '',
                          textStyle: AppStyles.bold16black,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.hadithBottomImage, width: width * .8),
                ],
              ),
            ),
          );
  }

  void loadHadithFile() async {
    String hadithContent = await rootBundle.loadString(
      'assets/files/hadith/h${widget.index}.txt',
    );
    String title = hadithContent.substring(0, hadithContent.indexOf('\n'));
    String content = hadithContent.substring(hadithContent.indexOf('\n') + 1);
    hadith = Hadith(title: title, content: content);
    setState(() {});
  }
}
