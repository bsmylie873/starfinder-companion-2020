import 'package:flutter/services.dart';
import 'sequentialListSearch.dart';

//Json data loaded into a Future of type String.
Future<String> loadFromAJson(String path) async {
  return await rootBundle.loadString(path);
}

//This method returns a list of strings that contain the user's query.
Future<List<String>> fetchSearched(String searchQuery, permList) async {
  //Parameter converted to lower case in new variable.
  String lowerCaseSearchQuery = searchQuery.toLowerCase();
  //Temporary list allowed to equal key list.
  List<String> tempList = permList;
  //Temporary list set to lower case.
  tempList = tempList.map((e) => e.toLowerCase()).toList();
  //Sequential search of temporary list with search query.
  return sequentialListSearch(lowerCaseSearchQuery, tempList, permList);
}