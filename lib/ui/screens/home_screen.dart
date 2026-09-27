import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/tabs/hadith/hadith_tab.dart';
import 'package:islami_app/ui/screens/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/screens/tabs/time/time_tab.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.QuranBG,
    AppAssets.HadithBG,
    AppAssets.SebhaBG,
    AppAssets.RadioBG,
    AppAssets.TimeBG,
  ];
  List<Widget> tabsList = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: AppColors.TransparentColor,
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.PrimaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              backgroundColor: AppColors.PrimaryColor,
              selectedItemColor: AppColors.WhiteColor,
              unselectedItemColor: AppColors.BlackColor,
              selectedLabelStyle: AppStyles.bold12white,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                _buildBottomNavBarItem(
                  iconName: AppAssets.QuranIcon,
                  label: 'Quran',
                  index: 0,
                ),
                _buildBottomNavBarItem(
                  iconName: AppAssets.HadithIcon,
                  label: 'Hadith',
                  index: 1,
                ),
                _buildBottomNavBarItem(
                  iconName: AppAssets.SebhaIcon,
                  label: 'Sebha',
                  index: 2,
                ),
                _buildBottomNavBarItem(
                  iconName: AppAssets.RadioIcon,
                  label: 'Radio',
                  index: 3,
                ),
                _buildBottomNavBarItem(
                  iconName: AppAssets.TimeIcon,
                  label: 'Time',
                  index: 4,
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              spacing: 10,
              children: [
                Image.asset(AppAssets.logo),
                Expanded(child: tabsList[selectedIndex]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem({
    required String iconName,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.BlackColorSelected,
              ),
              child: ImageIcon(AssetImage(iconName)),
            )
          : ImageIcon(AssetImage(iconName)),
      label: label,
    );
  }
}
