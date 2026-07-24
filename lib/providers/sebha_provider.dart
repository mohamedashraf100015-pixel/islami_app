import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int _counter = 0;
  int _dhikrIndex = 0;
  double _turns = 0.0;

  final List<String> dhikrList = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
  ];

  int get counter => _counter;
  String get currentDhikr => dhikrList[_dhikrIndex];
  double get turns => _turns;

  void onSebhaTap() {
    _counter++;
    _turns += 1 / 33; // حركة تدوير خفيفة للسبحة

    if (_counter >= 33) {
      _counter = 0;
      _dhikrIndex = (_dhikrIndex + 1) % dhikrList.length;
    }
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    _dhikrIndex = 0;
    _turns = 0.0;
    notifyListeners();
  }
}