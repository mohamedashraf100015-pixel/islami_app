import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamic_app/providers/hadeth_provider.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';
import 'package:islamic_app/utils/app_routes.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    final hadethProvider = Provider.of<HadethProvider>(context);

    if (hadethProvider.allHadeth.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
    }

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.82),
            itemCount: hadethProvider.allHadeth.length,
            itemBuilder: (context, index) {
              final hadeth = hadethProvider.allHadeth[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.hadethDetailsScreen,
                    arguments: {
                      'hadeth': hadeth,
                      'index': index + 1,
                    },
                  );
                },
                child: Container(height: 618,
                  width: 313.5,
                  margin: const EdgeInsets.symmetric(horizontal: 16.5,vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 9,
                        right: 8,
                        child: Image.asset(AppAssets.rightCornerHadeath, width: 85),
                      ),
                      Positioned(
                        top: 9,
                        left: 8,
                        child: Image.asset(AppAssets.leftCornerHadeath, width: 85),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          AppAssets.hadethBottomDecoration,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22.3,9,24.3,0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              hadeth.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  hadeth.content.join(''),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.blackColor,
                                    height: 1.8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
