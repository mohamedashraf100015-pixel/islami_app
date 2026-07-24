import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islamic_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islamic_app/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islamic_app/ui/home/tabs/time/time_tab.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabsList = const [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  final List<String> backgrounds = [
    AppAssets.quranBackground,
    AppAssets.hadethBackground,
    AppAssets.sebhaBackground,
    AppAssets.radioBackground,
    AppAssets.timeBackground,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            backgrounds[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: height * 0.01),
                Image.asset(AppAssets.mosque, height: height * 0.12),
                Expanded(
                  child: IndexedStack(
                    index: selectedIndex,
                    children: tabsList,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          buildNavItem(AppAssets.quranIcon, 'Quran', 0),
          buildNavItem(AppAssets.hadethIcon, 'Hadeth', 1),
          buildNavItem(AppAssets.sebhaIcon, 'Sebha', 2),
          buildNavItem(AppAssets.radioIcon, 'Radio', 3),
          buildNavItem(AppAssets.timeIcon, 'Time', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildNavItem(String iconPath, String label, int index) {
    bool isSelected = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: isSelected
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.blackBgNaviColor,
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                iconPath,
                colorFilter: const ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            )
          : SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                AppColors.blackColor,
                BlendMode.srcIn,
              ),
            ),
      label: label,
    );
  }
}
