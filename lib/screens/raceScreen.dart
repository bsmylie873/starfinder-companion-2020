import 'package:flutter_search_bar/flutter_search_bar.dart';

import '../objects/race.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RaceList extends StatefulWidget {
  @override
  RaceListState createState() => RaceListState();
}

class RaceListState extends State<RaceList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String searchRace = "";

  List<String> listOfRaceNames = new List();
  List<String> raceDetails = new List();

  Future<String> _loadFromRaceJson() async {
    return await rootBundle.loadString("data/sfrpg_races.json");
  }

  Future<List<String>> fetchRaces() async {
    String jsonString = await _loadFromRaceJson();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    listOfRaceNames = jsonResponses.keys.toList();
    return listOfRaceNames;
  }

  Future<List<String>> fetchARace(String RaceName) async {
    String jsonString = await _loadFromRaceJson();
    Race newRace = new Race();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newRace = Race.fromJson(jsonResponses[RaceName]);
    newRace.name = RaceName;
    raceDetails = newRace.raceDetails(newRace);
    return raceDetails;
  }

  Future<List<String>> fetchSearched(String searchQuery) async {
    List<String> searchValues = new List();
    searchQuery.toLowerCase();
    List<String> tempList = listOfRaceNames;
    tempList = tempList.map((e) => e.toLowerCase()).toList();
    for (var i = 0; i < listOfRaceNames.length; i++) {
      if (tempList[i].contains(searchQuery)) {
        searchValues.add(listOfRaceNames[i]);
        print(searchValues[0]);
      }
    }
    if (searchValues.isEmpty){
      searchValues.add("No results found!");
    }
    return searchValues;
  }

  Widget selectedRace(BuildContext context, String Race) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Race),
        ),
        body: FutureBuilder(
            future: fetchARace(Race),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createRaceSelectedView(context, snapshot);
              }
            }));
  }

  Widget searchedRace(BuildContext context, String searchQuery) {
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
                return createRaceListView(context, snapshot);
              }
            }));
  }

  Widget createRaceSelectedView(BuildContext context, AsyncSnapshot snapshot) {
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

  Widget createRaceListView(BuildContext context, AsyncSnapshot snapshot) {
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
                            selectedRace(context, values[index])));
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
        title: new Text('Races'),
        actions: [searchBar.getSearchAction(context)]);
  }

  onSubmitted(String value) {
    /*setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));*/
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedRace(context, value)));
  }

  RaceListState() {
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
            future: fetchRaces(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createRaceListView(context, snapshot);
              }
            }));
  }
}
