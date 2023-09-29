
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsProvider extends ChangeNotifier{
  String currLanguage = "English";
  String currMode = "Light";
  final Future<SharedPreferences> _appSettingsPrefs = SharedPreferences.getInstance();

  bool isDark ()=> currMode == "Dark";

  bool isArabic ()=> currLanguage == "Arabic";

  setLanguagePrefs(String lang) async{
    SharedPreferences appLanguagePrefs = await _appSettingsPrefs;
    appLanguagePrefs.setString("language", lang);
    currLanguage = lang;
    notifyListeners();
  }

  setThemePrefs(String mod) async{
    SharedPreferences appThemePrefs = await _appSettingsPrefs;
    appThemePrefs.setString("mode", mod);
    currMode = mod;
    notifyListeners();
  }

  getLanguagePrefs() async {
    SharedPreferences appLanguagePrefs = await _appSettingsPrefs;
    currLanguage = appLanguagePrefs.getString("language") ?? "Arabic";
    notifyListeners();
  }

  getThemePrefs() async {
    SharedPreferences appThemePrefs = await _appSettingsPrefs;
    currMode = appThemePrefs.getString("mode") ?? "Light";
    notifyListeners();
  }

}