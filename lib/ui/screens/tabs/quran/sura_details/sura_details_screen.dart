import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/tabs/quran/sura_details/sura_content.dart';
import 'package:islami_app/ui/screens/tabs/quran/sura_details1/sura_content1.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  bool isListView = true;

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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
            icon: Icon(
              isListView ? Icons.menu : Icons.article,
              color: AppColors.primaryColor,
            ),
          ),
        ],
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
            SizedBox(height: height * .02),
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
                  : isListView
                  ? ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.02,
                      ),
                      itemBuilder: (context, index) {
                        return SuraContent(
                          content: verses[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.02);
                      },
                      itemCount: verses.length,
                    )
                  : SingleChildScrollView(
                      child: SuraContent1(
                        content: verses
                            .asMap()
                            .entries
                            .map(
                              (entry) => '${entry.value} [${entry.key + 1}] ',
                            )
                            .join(' '),
                      ),
                    ),
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

    verses = lines;
    Future.delayed(Duration(milliseconds: 500), () => setState(() {}));
  }
}
