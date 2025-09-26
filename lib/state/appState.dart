import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  ThemeMode themeMode;

  AppState({this.themeMode = ThemeMode.light});

  void toggleMode() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
