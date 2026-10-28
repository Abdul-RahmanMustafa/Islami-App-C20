import 'package:flutter/material.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';
import 'package:islami_app/widgets/most_recent_widget.dart';
import 'package:islami_app/widgets/sura_item_widget.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        spacing: height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppStyles.bold20white,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: _buildDecorationBorder(),
              focusedBorder: _buildDecorationBorder(),
              prefixIcon: Image.asset(AppAssets.SearchIcon),
              hintText: 'Sura Name',
              hintStyle: Theme.of(context).textTheme.headlineLarge,
            ),
            onChanged: (text) {
              searchBySuraName(text);
            },
          ),
          MostRecentWidget(),
          Text('Suras List', style: AppStyles.bold16white),
          Expanded(child: filterList.isEmpty ?
          Center(
            child: Text('No Sura Has This Name', style: AppStyles.bold20primary
              ,),)
              : ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: navigate to sura details screen
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailsRouteName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItemWidget(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  height: height * 0.02,
                  indent: width * 0.06,
                  endIndent: width * 0.06,
                );
              },
            itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchBySuraName(String suraName) {
    List<int> searchList = [];
    if (suraName.isEmpty) {
      filterList = List.generate(114, ((index) => index));
      setState(() {

      });
      return;
    }
    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(
          suraName.toLowerCase())) {
        searchList.add(i);
      }
      if (QuranResources.arabicQuranSuraList[i].contains(suraName)) {
        searchList.add(i);
      }
    }
    filterList = searchList;
    setState(() {});
  }
}



OutlineInputBorder _buildDecorationBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
  );
}

