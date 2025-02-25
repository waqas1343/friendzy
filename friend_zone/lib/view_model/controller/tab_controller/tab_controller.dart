import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  int selectedIndex2 = 0;

  void setSelectedIndex2(int index) {
    selectedIndex2 = index;
    notifyListeners();
  }
}
