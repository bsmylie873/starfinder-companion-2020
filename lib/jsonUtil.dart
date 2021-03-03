import 'dart:convert';
import 'objects/class.dart';
import 'objects/race.dart';
import 'objects/spell.dart';
import 'objects/weapon.dart';
import 'package:flutter/services.dart';
import 'sequentialListSearch.dart';

//This method fetches the details of a single index.
Future<List<String>> fetchAnIndex(String jsonLocation, String indexType, String indexName, List<String> indexDetails) async {
  //Json loaded from appropriate file determined by parameter.
  String jsonString = await loadFromAJson(jsonLocation);
  //Index type used to determine index type.
  if (indexType == "Class"){
    //Class object created.
    Class newClass = new Class();
    //Future of type string parsed into a map.
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    //NewClass takes values from matching entry in jsonResponses map.
    newClass = Class.fromJson(jsonResponses[indexName]);
    newClass.name = indexName;
    //List of strings takes values from newSpell and then returned.
    indexDetails = newClass.classDetails(newClass);
    return indexDetails;
  }

  if (indexType == "Race"){
    //Race object created.
    Race newRace = new Race();
    //Future of type string parsed into a map.
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    //NewClass takes values from matching entry in jsonResponses map.
    newRace = Race.fromJson(jsonResponses[indexName]);
    newRace.name = indexName;
    //List of strings takes values from newSpell and then returned.
    indexDetails = newRace.raceDetails(newRace);
    return indexDetails;
  }

  if (indexType == "Spell"){
    //Spell object created.
    Spell newSpell = new Spell();
    //Future of type string parsed into a map.
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    //NewClass takes values from matching entry in jsonResponses map.
    newSpell = Spell.fromJson(jsonResponses[indexName]);
    newSpell.name = indexName;
    //List of strings takes values from newSpell and then returned.
    indexDetails = newSpell.spellDetails(newSpell);
    return indexDetails;
  }

  if (indexType == "Weapon"){
    //Weapon object created.
    Weapon newWeapon = new Weapon();
    //Future of type string parsed into a map.
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    //NewClass takes values from matching entry in jsonResponses map.
    newWeapon = Weapon.fromJson(jsonResponses[indexName]);
    newWeapon.name = indexName;
    //List of strings takes values from newSpell and then returned.
    indexDetails = newWeapon.weaponDetails(newWeapon);
    return indexDetails;
  }

  //Index type error handling.
  else {
    indexDetails.add("Something went wrong! Index not set correctly!");
    return indexDetails;
  }

}

//This method creates a string list of all entries.
Future<List<String>> fetchEntries(String jsonLocation) async {
  //New list created to hold entries to be returned.
  List<String> permanentList = new List();
  String jsonString = await loadFromAJson(jsonLocation);
  //Future String parsed into a map.
  Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
  //Keys extracted from map (names).
  permanentList = jsonResponses.keys.toList();
  //Sort list alphabetically.
  permanentList.sort();
  return permanentList;
}


//This method returns a list of strings that contain the user's query.
Future<List<String>> fetchSearched(String searchQuery, String indexType) async {
  //Parameter converted to lower case in new variable.
  String lowerCaseSearchQuery = searchQuery.toLowerCase();
  //New list created to hold entries to be searched.
  List<String> searchList = new List();
  //File location string initialised.
  String jsonLocation = "";

  //Index type used to determine index type.
  if (indexType == "Class") {
    //Appropriate file chosen.
    jsonLocation = "data/sfrpg_classes.json";
  }

  if (indexType == "Race") {
    //Appropriate file chosen.
    jsonLocation = "data/sfrpg_races.json";
  }

  if (indexType == "Spell") {
    //Appropriate file chosen.
    jsonLocation = "data/sfrpg_spells.json";
  }

  if (indexType == "Weapon") {
    //Appropriate file chosen.
    jsonLocation = "data/sfrpg_weapons.json";
  }

  //List of strings populated with keys.
  searchList = await fetchEntries(jsonLocation);
  //Temporary list allowed to equal key list.
  List<String> tempList = searchList;
  //Temporary list set to lower case.
  tempList = tempList.map((e) => e.toLowerCase()).toList();
  //Sequential search of temporary list with search query.
  return sequentialListSearch(lowerCaseSearchQuery, tempList, searchList);
}

//Json data loaded into a Future of type String.
Future<String> loadFromAJson(String path) async {
  return await rootBundle.loadString(path);
}


