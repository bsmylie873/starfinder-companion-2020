import 'darkTheme.dart';
import 'package:flutter/material.dart';
import 'storageManager.dart';
import 'theme.dart';

class ThemeManager with ChangeNotifier{
  ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeManager() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }
  void toggleMode() async {
    if (_themeData == lightTheme) {
      setDarkMode();
    } else {
      setLightMode();
    }
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}