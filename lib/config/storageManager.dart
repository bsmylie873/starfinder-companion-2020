//CONTRIBUTION - BRANDON 100% CONOR 0%

import 'package:shared_preferences/shared_preferences.dart';

//This class handles the preferences of the user, which for now only handles the
//theme. This would also ideally handle parts of the settings screen too.
class StorageManager {
  //Static async method to set saved data as a type.
  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  //Static future method to return saved key.
  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  //Static future method to delete saved key.
  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

//All code found here is thanks to:
//https://stackoverflow.com/questions/60232070/how-to-implement-dark-mode-in-flutter