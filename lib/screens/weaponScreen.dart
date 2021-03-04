import '../enums.dart';
import '../jsonUtil.dart';
import 'package:flutter/material.dart';
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
  //Store location of JSON data.
  final String jsonLocation = "data/sfrpg_weapons.json";
  //Index type identifies which index is being processed.
  indexType weaponEnum = indexType.WEAPON;

  //List of strings for different fetch methods initialised.
  List<String> weaponDetails = new List();

  //Weapon detail display widget, with a weapon as a parameter.
  Widget selectedWeapon(BuildContext context, String weapon) {
    return Scaffold(
        appBar: AppBar(
          title: Text(weapon),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchAnIndex method with parameter.
            future: fetchAnEntry(jsonLocation, weaponEnum, weapon, weaponDetails),
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
            future: fetchSearched(searchQuery, weaponEnum),
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
            future: fetchEntries(jsonLocation),
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
