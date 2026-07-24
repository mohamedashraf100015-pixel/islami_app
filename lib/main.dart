import 'package:flutter/material.dart';
import 'package:islamic_app/providers/hadeth_provider.dart';
import 'package:islamic_app/ui/home/tabs/hadeth/details/hadeth_details_screen.dart';
import 'package:islamic_app/ui/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islamic_app/ui/introduction/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:islamic_app/providers/quran_provider.dart';
import 'package:islamic_app/providers/sebha_provider.dart';
import 'package:islamic_app/providers/time_provider.dart';
import 'package:islamic_app/ui/home/home_screen.dart';
import 'package:islamic_app/utils/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuranProvider()),
        ChangeNotifierProvider(create: (_) => SebhaProvider()),
        ChangeNotifierProvider(create: (_) => TimeProvider()),
        ChangeNotifierProvider(create: (_) => HadethProvider()..loadHadethFiles()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islamic App',
      theme: ThemeData(
        fontFamily: 'Janna LT',
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.introRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => const HomeScreen(),
        AppRoutes.introRouteName: (context) => const IntroScreen(),
        AppRoutes.suraDetailsScreen: (context) => const SuraDetailsScreen(),
        AppRoutes.hadethDetailsScreen: (context) => const HadethDetailsScreen(),
      },
    );
  }
}
