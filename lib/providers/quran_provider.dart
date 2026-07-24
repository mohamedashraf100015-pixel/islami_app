import 'package:flutter/material.dart';
import '../model/quran_resources.dart';
import '../model/sura_model.dart';

class QuranProvider extends ChangeNotifier {
  String _searchQuery = "";
  final List<SuraModel> _recentlyOpened = [];

  // Cache the list so it is only created ONCE in memory
  late final List<SuraModel> _allSurahs;

  QuranProvider() {
    // Initialize the list once when the provider is created
    _allSurahs = List.generate(QuranResources.englishQuranSuraList.length, (i) {
      return SuraModel(
        index: i + 1,
        arabicName: QuranResources.arabicQuranSuraList[i],
        englishName: QuranResources.englishQuranSuraList[i],
        // Keeping the String structure as requested and parsing here
        versesCount: int.parse(QuranResources.ayaNumberList[i]),
      );
    });
  }

  String get searchQuery => _searchQuery;
  List<SuraModel> get recentlyOpened => List.unmodifiable(_recentlyOpened);

  // Return the cached list instead of rebuilding it
  List<SuraModel> get allSurahs => _allSurahs;

  List<SuraModel> get filteredSurahs {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) return _allSurahs;

    return _allSurahs.where((sura) {
      return sura.englishName.toLowerCase().contains(query) ||
          sura.arabicName.contains(query);
    }).toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void openSura(SuraModel sura) {
    _recentlyOpened.removeWhere((item) => item.index == sura.index);
    _recentlyOpened.insert(0, sura);
    if (_recentlyOpened.length > 5) {
      _recentlyOpened.removeLast();
    }
    notifyListeners();
  }
}