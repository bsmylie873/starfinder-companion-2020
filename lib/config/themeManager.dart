import 'constants/darkTheme.dart';
import 'constants/theme.dart';
import 'package:flutter/material.dart';
import 'storageManager.dart';


//Class to handle the theme of the app changing.
class ThemeManager with ChangeNotifier{
  //Theme initialised.
  ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  //Theme read from local storage.
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
      //Listener to notified to change theme.
      notifyListeners();
    });
  }

  //Mode is changed to other mode, and the set methods are called.
  void toggleMode() async {
    if (_themeData == lightTheme) {
      setDarkMode();
    } else {
      setLightMode();
    }
  }

  //Dark mode setting is applied.
  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  //Light mode setting is applied.
  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}

//All code found here is thanks to:
//https://stackoverflow.com/questions/60232070/how-to-implement-dark-mode-in-flutter