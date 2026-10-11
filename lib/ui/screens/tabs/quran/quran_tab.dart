import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';
import 'package:islami_app/widgets/most_recent_widget.dart';
import 'package:islami_app/widgets/sura_item_widget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: _buildDecorationBorder(),
              focusedBorder: _buildDecorationBorder(),
              prefixIcon: Image.asset(AppAssets.SearchIcon),
              hintText: 'Sura Name',
              hintStyle: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          MostRecentWidget(),
          Text('Suras List', style: AppStyles.bold16white),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: navigate to sura details screen
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailsRouteName,
                      arguments: index,
                    );
                  },
                  child: SuraItemWidget(index: index),
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
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder _buildDecorationBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
  );
}
