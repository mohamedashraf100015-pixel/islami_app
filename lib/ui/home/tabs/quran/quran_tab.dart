import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:islamic_app/providers/quran_provider.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';
import 'package:islamic_app/utils/app_routes.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final quranProvider = Provider.of<QuranProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Field
          TextField(
            onChanged: (val) => quranProvider.setSearchQuery(val),
            style: const TextStyle(color: AppColors.whiteColor),
            decoration: InputDecoration(
              hintText: "Sura Name",
              hintStyle: const TextStyle(color: AppColors.whiteColor),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  AppAssets.quranSearchIcon,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              filled: true,
              fillColor: AppColors.blackColor.withOpacity(0.6),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Most Recently Opened Section
          if (quranProvider.recentlyOpened.isNotEmpty &&
              quranProvider.searchQuery.isEmpty) ...[
            const Text(
              "Most Recently",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: quranProvider.recentlyOpened.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final sura = quranProvider.recentlyOpened[index];
                  return GestureDetector(
                    onTap: () {
                      quranProvider.openSura(sura);
                      Navigator.pushNamed(
                        context,
                        AppRoutes.suraDetailsScreen,
                        arguments: sura,
                      );
                    },
                    child: Container(
                      width: 260,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                sura.englishName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              Text(
                                sura.arabicName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              Text(
                                "${sura.versesCount} Verses",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(AppAssets.imageMostRecent, height: 80),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],

          const Text(
            "Suras List",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // Suras List
          Expanded(
            child: ListView.separated(
              itemCount: quranProvider.filteredSurahs.length,
              separatorBuilder: (_, __) => const Divider(
                color: AppColors.whiteColor,
                thickness: 0.5,
              ),
              itemBuilder: (context, index) {
                final sura = quranProvider.filteredSurahs[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.suraNumIcon,
                        width: 42,
                        height: 42,
                        errorBuilder: (_, __, ___) => Image.asset(
                          AppAssets.imageSuraNum,
                          width: 42,
                          height: 42,
                        ),
                      ),
                      Text(
                        "${sura.index}",
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    sura.englishName,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${sura.versesCount} Verses",
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 12,
                    ),
                  ),
                  trailing: Text(
                    sura.arabicName,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    quranProvider.openSura(sura);
                    Navigator.pushNamed(
                      context,
                      AppRoutes.suraDetailsScreen,
                      arguments: sura,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}