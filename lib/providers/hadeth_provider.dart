import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/hadeth_model.dart';

class HadethProvider extends ChangeNotifier {
  List<HadethModel> allHadeth = [];

  Future<void> loadHadethFiles() async {
    List<HadethModel> hadethList = [];
    for (int i = 1; i <= 50; i++) {
      String fileContent =
          await rootBundle.loadString('assets/files/hadeath/h$i.txt');
      List<String> lines = fileContent.trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      hadethList.add(HadethModel(title: title, content: lines));
    }
    allHadeth = hadethList;
    notifyListeners();
  }
}
