import 'package:flutter/material.dart';
import '../../core/prefs_manager/prefs_manager.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = PrefsManager.getTheme() ?? ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    PrefsManager.saveTheme(newTheme);
    notifyListeners();
  }

  bool get isDark => currentTheme == ThemeMode.dark;
}
