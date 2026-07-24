import 'package:flutter/material.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  // Index 0 -> Radio, Index 1 -> Reciters
  int selectedCategoryIndex = 0;

  final List<String> radioChannels = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-Trabulsi",
    "Radio Addokali Mohammad Al-Alim",
  ];

  final List<String> reciters = [
    "Ibrahim Al-Akdar",
    "Akram Al-Alaqmi",
    "Majed Al-Enezi",
    "Malik Shaiba Al-Hamad",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> currentList =
    selectedCategoryIndex == 0 ? radioChannels : reciters;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 8),

          // Top Tab Selector (Radio / Reciters)
          Container(
            decoration: BoxDecoration(
              color: AppColors.blackColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 0
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Radio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedCategoryIndex == 0
                              ? AppColors.blackColor
                              : AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 1
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Reciters",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedCategoryIndex == 1
                              ? AppColors.blackColor
                              : AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Radio Items List
          Expanded(
            child: ListView.separated(
              itemCount: currentList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                return RadioCardItem(
                  title: currentList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RadioCardItem extends StatefulWidget {
  final String title;

  const RadioCardItem({super.key, required this.title});

  @override
  State<RadioCardItem> createState() => _RadioCardItemState();
}

class _RadioCardItemState extends State<RadioCardItem> {
  bool isPlaying = false;
  bool isMuted = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Background Mosque Decoration Vector on Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                AppAssets.hadethBottomDecoration,
                fit: BoxFit.cover,
                height: 85,
                opacity: const AlwaysStoppedAnimation(0.25),
              ),
            ),
          ),

          // Main Card Elements
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Favorite Toggle Button
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.blackColor,
                        size: 26,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                    const SizedBox(width: 16),

                    // Play/Pause Toggle Button
                    IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        color: AppColors.blackColor,
                        size: 46,
                      ),
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                    ),
                    const SizedBox(width: 16),

                    // Mute/Unmute Toggle Button
                    IconButton(
                      icon: Icon(
                        isMuted ? Icons.volume_off : Icons.volume_up,
                        color: AppColors.blackColor,
                        size: 26,
                      ),
                      onPressed: () {
                        setState(() {
                          isMuted = !isMuted;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}