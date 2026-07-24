import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  String selectedCity = "Cairo, Egypt";
  int activePrayerIndex = 0;

  final List<Map<String, String>> prayerTimes = [
    {"name": "Fajr", "time": "04:30 AM"},
    {"name": "Sunrise", "time": "06:02 AM"},
    {"name": "Dhuhr", "time": "12:05 PM"},
    {"name": "Asr", "time": "03:25 PM"},
    {"name": "Maghrib", "time": "06:08 PM"},
    {"name": "Isha", "time": "07:35 PM"},
  ];

  void changeCity(String newCity) {
    selectedCity = newCity;
    notifyListeners();
  }
}