import 'package:flutter/material.dart';
import 'package:islamic_app/utils/app_assets.dart';
import '../../../../../model/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final hadeth = args['hadeth'] as HadethModel;
    final index = args['index'] as int;

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
          "Hadeth $index",
          style: const TextStyle(
            color: Color(0xFFE2BE7F),
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  hadeth.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFE2BE7F),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        hadeth.content.join(''),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Color(0xFFE2BE7F),
                          fontSize: 20,
                          height: 1.8,
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
}
