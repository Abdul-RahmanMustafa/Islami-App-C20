import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/tabs/quran/sura_details1/sura_content1.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String verses = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = context.width;
    var height = context.height;

    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20primary,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.SuraBG)),
        ),
        child: Column(
          spacing: height * 0.02,
          children: [
            SizedBox(height: height * 0.01),
            Text(
              QuranResources.arabicQuranSuraList[index],
              style: AppStyles.bold24primary,
            ),
            Expanded(
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : SingleChildScrollView(child: SuraContent1(content: verses)),
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += " [${i + 1}] ";
    }
    verses = lines.join(' ');
    Future.delayed(Duration(milliseconds: 500), () => setState(() {}));
  }
}
