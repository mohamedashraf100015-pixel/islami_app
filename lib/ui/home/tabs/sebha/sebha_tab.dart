import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamic_app/providers/sebha_provider.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    final sebhaProvider = Provider.of<SebhaProvider>(context);

    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GestureDetector(
            onTap: () => sebhaProvider.onSebhaTap(),
            behavior: HitTestBehavior.opaque,
            child: Center(
              child: SizedBox(
                width: 320,
                height: 380,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: sebhaProvider.turns,
                      alignment: const Alignment(0.0, 0.15),
                      child: Image.asset(
                        AppAssets.sebhaHandIcon,
                        height: 380,
                        width: 380,
                        fit: BoxFit.fill,
                      ),
                    ),

                    Positioned(
                      top: 130,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 35),
                          Text(
                            sebhaProvider.currentDhikr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${sebhaProvider.counter}",
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
