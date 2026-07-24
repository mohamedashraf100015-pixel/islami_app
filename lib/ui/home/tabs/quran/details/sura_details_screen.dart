import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/utils/app_assets.dart';
import '../../../../../model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    final sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraContent.isEmpty) {
      loadSuraFile(sura.index);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFE2BE7F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          sura.englishName,
          style: const TextStyle(
            color: Color(0xFFE2BE7F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 9,
            left: 18,
            child: Image.asset(AppAssets.leftCornerSoura, width: 85),
          ),
          Positioned(
            top: 9,
            right: 18,
            child: Image.asset(AppAssets.rightCornerSoura, width: 85),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.souraBottomDecoration,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  sura.arabicName,
                  style: const TextStyle(
                    color: Color(0xFFE2BE7F),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: suraContent.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFFE2BE7F),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              suraContent,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                color: Color(0xFFE2BE7F),
                                fontSize: 20,
                                height: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String content = await rootBundle.loadString('assets/files/quran/$index.txt');
    List<String> lines = content.trim().split('\n');
    String fullSura = "";
    for (int i = 0; i < lines.length; i++) {
      fullSura += " [${i + 1}] ${lines[i].trim()}";
    }
    setState(() {
      suraContent = fullSura;
    });
  }
}
