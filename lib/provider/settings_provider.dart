
import 'package:flutter/material.dart';


class SettingsProvider extends ChangeNotifier{
  Locale currentLocale= const Locale('en');
  ThemeMode currentTheme = ThemeMode.light;

  bool isDark ()=> currentTheme == ThemeMode.dark;

  bool isArabic ()=> currentLocale == const Locale('ar');
  setCurrentLocale(Locale loc){
    currentLocale = loc;
    notifyListeners();
  }

  setCurrentMode(ThemeMode theme){
    currentTheme = theme;
    notifyListeners();
  }


}