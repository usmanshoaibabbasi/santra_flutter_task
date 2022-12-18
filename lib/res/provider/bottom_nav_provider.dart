// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class BottomNavProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  ///
  void setindex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
