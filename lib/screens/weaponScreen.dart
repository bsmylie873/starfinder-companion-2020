import '../objects/weapon.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class WeaponList extends StatefulWidget {
  @override
  WeaponListState createState() => WeaponListState();
}

class WeaponListState extends State<WeaponList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<String> listOfWeaponNames = new List();
  List<String> weaponDetails = new List();

  Future<String> _loadFromWeaponJson() async {
    return await rootBundle.loadString("data/sfrpg_weapons.json");
  }

  Future<List<String>> fetchWeapon() async {
    String jsonString = await _loadFromWeaponJson();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    listOfWeaponNames = jsonResponses.keys.toList();
    return listOfWeaponNames;
  }

  Future<List<String>> fetchAWeapon(String weaponName) async {
    String jsonString = await _loadFromWeaponJson();
    Weapon newWeapon = new Weapon();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newWeapon = Weapon.fromJson(jsonResponses[weaponName]);
    newWeapon.name = weaponName;
    weaponDetails = newWeapon.weaponDetails(newWeapon);
    return weaponDetails;
  }

  Future<List<String>> fetchSearched(String searchQuery) async {
    List<String> searchValues = new List();
    searchQuery.toLowerCase();
    List<String> tempList = listOfWeaponNames;
    tempList = tempList.map((e) => e.toLowerCase()).toList();
    for (var i = 0; i < listOfWeaponNames.length; i++) {
      if (tempList[i].contains(searchQuery)) {
        searchValues.add(listOfWeaponNames[i]);
        print(searchValues[0]);
      }
    }
    if (searchValues.isEmpty){
      searchValues.add("No results found!");
    }
    return searchValues;
  }

  Widget selectedWeapon(BuildContext context, String weapon) {
    return Scaffold(
        appBar: AppBar(
          title: Text(weapon),
        ),
        body: FutureBuilder(
            future: fetchAWeapon(weapon),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createWeaponSelectedView(context, snapshot);
              }
            }));
  }

  Widget searchedWeapon(BuildContext context, String searchQuery) {
    return Scaffold(
        appBar: AppBar(
          title: Text(searchQuery),
        ),
        body: FutureBuilder(
            future: fetchSearched(searchQuery),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createWeaponListView(context, snapshot);
              }
            }));
  }

  Widget createWeaponSelectedView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values1 = snapshot.data;
    return new ListView.separated(
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
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  Widget createWeaponListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            selectedWeapon(context, values[index])));
              },
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }

  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Weapons'),
        actions: [searchBar.getSearchAction(context)]);
  }

  onSubmitted(String value) {
    /*setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));*/
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedWeapon(context, value)));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: searchBar.build(context),
        key: _scaffoldKey,
        body: FutureBuilder(
            future: fetchWeapon(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createWeaponListView(context, snapshot);
              }
            }));
  }
}
