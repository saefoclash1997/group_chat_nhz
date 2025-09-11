

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDarkMode =  false;

  Future<void> getThemeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode =  prefs . getBool("isDarkMode") ?? false;
  }

  bool isDarkMode() {
    getThemeData();
    return _isDarkMode;
  }

  void toggleTheme(){
    _isDarkMode = !_isDarkMode;
    saveThemeData ();
    notifyListeners();
  }

  Future<void> saveThemeData () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs . setBool("isDarkMode", _isDarkMode);
  }




}