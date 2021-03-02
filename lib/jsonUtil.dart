import 'package:flutter/services.dart';

//Json data loaded into a Future of type String.
Future<String> loadFromAJson(String path) async {
  return await rootBundle.loadString(path);
}