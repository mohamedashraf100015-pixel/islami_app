import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_routes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color goldColor = Color(0xFFE2BE7F);
    const Color scaffoldBgColor = Color(0xFF212121);

    const TextStyle titleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: goldColor,
    );

    const TextStyle bodyStyle = TextStyle(
      fontSize: 20,
      color: goldColor,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: IntroductionScreen(
        globalHeader: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(right: 69.5, top: 16, left: 69.5),
            child: Image.asset(AppAssets.mosque),
          ),
        ),
        globalBackgroundColor: scaffoldBgColor,
        allowImplicitScrolling: true,
        pages: [
          PageViewModel(
            title: "Welcome To Islmi App",
            body: "",
            image: Image.asset(AppAssets.introWelcome, height: 415, width: 398),
            decoration: PageDecoration(
              boxDecoration: const BoxDecoration(color: scaffoldBgColor),
              titleTextStyle: titleStyle,
              bodyTextStyle: bodyStyle,
              pageMargin: EdgeInsets.only(top: 200),
              imagePadding: const EdgeInsets.only(
                right: 53.5,
                left: 53.5,
              ), // Unique spacing
              titlePadding: const EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 16,
              ),
              bodyPadding: EdgeInsets.zero,
            ),
          ),

          PageViewModel(
            title: "Welcome To Islami",
            body: "We Are Very Excited To Have You In Our Community",
            image: Image.asset(
              AppAssets.introMosque,
              height: 415,
              width: 398,
              fit: BoxFit.fill,
            ),
            decoration: const PageDecoration(
              boxDecoration: BoxDecoration(color: scaffoldBgColor),
              titleTextStyle: titleStyle,
              bodyTextStyle: bodyStyle,
              pageMargin: EdgeInsets.only(top: 200),
              imagePadding: EdgeInsets.only(right: 53.5, left: 53.5),
              titlePadding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              bodyPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            ),
          ),

          PageViewModel(
            title: "Reading the Quran",
            body: "Read, and your Lord is the Most Generous",
            image: Image.asset(
              AppAssets.introQuran,
              height: 415,
              width: 398,
              fit: BoxFit.fill,
            ),
            decoration: const PageDecoration(
              boxDecoration: BoxDecoration(color: scaffoldBgColor),
              titleTextStyle: titleStyle,
              bodyTextStyle: bodyStyle,
              pageMargin: EdgeInsets.only(top: 200),
              imagePadding: EdgeInsets.only(
                right: 53.5,
                left: 53.5,
              ), // Unique spacing
              titlePadding: EdgeInsets.symmetric(
                vertical: 50.5,
                horizontal: 16,
              ),
              bodyPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 50.5),
            ),
          ),

          PageViewModel(
            title: "Bearish",
            body: "Praise the name of your Lord, the Most High",
            image: Image.asset(
              AppAssets.introAzkar,
              height: 415,
              width: 398,
              fit: BoxFit.fill,
            ),
            decoration: const PageDecoration(
              boxDecoration: BoxDecoration(color: scaffoldBgColor),
              titleTextStyle: titleStyle,
              bodyTextStyle: bodyStyle,
              pageMargin: EdgeInsets.only(top: 200),
              imagePadding: EdgeInsets.only(right: 53.5, left: 53.5),
              titlePadding: EdgeInsets.symmetric(
                vertical: 41,
                horizontal: 16.0,
              ),
              bodyPadding: EdgeInsets.symmetric(vertical: 41, horizontal: 16.0),
            ),
          ),

          PageViewModel(
            title: "Holy Quran Radio",
            body:
                "You can listen to the Holy Quran Radio through the application for free and easily",
            image: Image.asset(
              AppAssets.introRadio,
              height: 415,
              width: 398,
              fit: BoxFit.fill,
            ),
            decoration: const PageDecoration(
              boxDecoration: BoxDecoration(color: scaffoldBgColor),
              titleTextStyle: titleStyle,
              bodyTextStyle: bodyStyle,
              pageMargin: EdgeInsets.only(top: 200),
              imagePadding: EdgeInsets.only(
                right: 53.5,
                left: 53.5,
              ), // Unique spacing
              titlePadding: EdgeInsets.symmetric(
                vertical: 41,
                horizontal: 16.0,
              ),
              bodyPadding: EdgeInsets.symmetric(vertical: 41, horizontal: 16.0),
            ),
          ),
        ],

        onDone: () {
          Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
        },
        onSkip: () {
          Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
        },
        showSkipButton: true,
        showBackButton: false,
        skip: const Text(
          "Back",
          style: TextStyle(
            color: goldColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 5,
          ),
        ),
        next: const Text(
          "Next",
          style: TextStyle(
            color: goldColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 5,
          ),
        ),
        done: const Text(
          "Finish",
          style: TextStyle(
            color: goldColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 5,
          ),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(8, 8),
          color: Color(0xFF707070),
          activeColor: goldColor,
          activeSize: Size(18, 8),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
