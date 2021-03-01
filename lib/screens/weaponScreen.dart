import '../objects/weapon.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

//Stateful WeaponList class.
class WeaponList extends StatefulWidget {
  @override
  WeaponListState createState() => WeaponListState();
}

//State of stateful WeaponList class.
class WeaponListState extends State<WeaponList> {
  //Scaffold key used for SearchBar declared.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //List of strings for different fetch methods initialised.
  List<String> listOfWeaponNames = new List();
  List<String> weaponDetails = new List();

  //Json data loaded into a Future of type String.
  Future<String> _loadFromWeaponJson() async {
    return await rootBundle.loadString("data/sfrpg_weapons.json");
  }

  //This method creates a string list of all weapons.
  Future<List<String>> fetchWeapons() async {
    String jsonString = await _loadFromWeaponJson();
    //Future String parsed into a map.
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    //Keys extracted from map (weapon names).
    listOfWeaponNames = jsonResponses.keys.toList();
    return listOfWeaponNames;
  }

  //This method fetches the details of a single weapon.
  Future<List<String>> fetchAWeapon(String weaponName) async {
    String jsonString = await _loadFromWeaponJson();
    //Weapon object created.
    Weapon newWeapon = new Weapon();
    //Future of type string parsed into a map.
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    //NewWeapon takes values from matching entry in jsonResponses map.
    newWeapon = Weapon.fromJson(jsonResponses[weaponName]);
    newWeapon.name = weaponName;
    //List of strings takes values from newWeapon and then returned.
    weaponDetails = newWeapon.weaponDetails(newWeapon);
    return weaponDetails;
  }

  Future<List<String>> fetchSearched(String searchQuery) async {
    //List of strings created.
    List<String> searchValues = new List();
    //Parameter converted to lower case.
    searchQuery.toLowerCase();
    //Temporary list allowed to equal key list.
    List<String> tempList = listOfWeaponNames;
    //Temporary list set to lower case.
    tempList = tempList.map((e) => e.toLowerCase()).toList();
    //Sequential search of temporary list with search query.
    for (var i = 0; i < listOfWeaponNames.length; i++) {
      if (tempList[i].contains(searchQuery)) {
        searchValues.add(listOfWeaponNames[i]);
        print(searchValues[0]);
      }
    }
    //Some error handling in case search has no matches.
    if (searchValues.isEmpty){
      searchValues.add("No results found!");
    }
    //Result returned.
    return searchValues;
  }

  //Weapon detail display widget, with a weapon as a parameter.
  Widget selectedWeapon(BuildContext context, String weapon) {
    return Scaffold(
        appBar: AppBar(
          title: Text(weapon),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchAWeapon method with parameter.
            future: fetchAWeapon(weapon),
            builder: (context, snapshot) {
              //Some indication of activity for the user when delayed.
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              //Weapon detail display widget, for the body of selectedWeapon.
              else {
                return createWeaponSelectedView(context, snapshot);
              }
            }));
  }

  //Search result display widget, with query as a parameter.
  Widget searchedWeapon(BuildContext context, String searchQuery) {
    return Scaffold(
        appBar: AppBar(
          title: Text(searchQuery),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchSearched method with parameter.
            future: fetchSearched(searchQuery),
            builder: (context, snapshot) {
              //Some indication of activity for the user when delayed.
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              //Weapon search result displayed in body of searchedWeapon.
              else {
                return createWeaponListView(context, snapshot);
              }
            }));
  }

  //Weapon detail display widget, for the body of selectedWeapon.
  Widget createWeaponSelectedView(BuildContext context, AsyncSnapshot snapshot) {
    //Snapshot data converted to a list of strings.
    List<String> values1 = snapshot.data;
    return new ListView.separated(
      //Items counted, and a list of tiles created with snapshot data.
        itemCount: values1.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(values1[index]),
              ),
            ],
          );
        },
        //Create some separation between tiles.
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  //Weapon search result displayed in body of searchedWeapon.
  Widget createWeaponListView(BuildContext context, AsyncSnapshot snapshot) {
    //Snapshot data converted to a list of strings.
    List<String> values = snapshot.data;
    return new ListView.builder(
      //Items counted, and a list of tiles created with snapshot data.
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index]),
              //When tapped, tile will load weapon details.
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            selectedWeapon(context, values[index])));
              },
            ),
            //Create some separation between tiles.
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }

  //SearchBar initialised.
  SearchBar searchBar;

  //Build the AppBar with the search functionality.
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Weapons'),
        actions: [searchBar.getSearchAction(context)]);
  }

  //When a search query is submitted, this method handles the input.
  onSubmitted(String value) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedWeapon(context, value)));
  }

  //SearchBar parameters set.
  WeaponListState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }

  //Build method for weaponListState.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Custom AppBar used.
        appBar: searchBar.build(context),
        //Private key used.
        key: _scaffoldKey,
        body: FutureBuilder(
          //Future builder which calls the fetchWeapons method.
            future: fetchWeapons(),
            builder: (context, AsyncSnapshot snapshot) {
              //Some indication of activity for the user when delayed.
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              //Weapon list displayed in body of build method.
              else {
                return createWeaponListView(context, snapshot);
              }
            }));
  }
}
