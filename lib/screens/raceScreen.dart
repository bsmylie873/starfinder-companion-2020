import '../jsonUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

//Stateful RaceList class.
class RaceList extends StatefulWidget {
  @override
  RaceListState createState() => RaceListState();
}

//State of stateful RaceList class.
class RaceListState extends State<RaceList> {
  //Scaffold key used for SearchBar declared.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //Store location of JSON data.
  final String jsonLocation = "data/sfrpg_races.json";
  //Index type identifies which index is being processed.
  final String indexType = "Race";

  //List of strings for different fetch methods initialised.
  List<String> raceDetails = new List();

  //Race detail display widget, with a race as a parameter.
  Widget selectedRace(BuildContext context, String race) {
    return Scaffold(
        appBar: AppBar(
          title: Text(race),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchARace method with parameter.
            future: fetchAnIndex(jsonLocation, indexType, race, raceDetails),
            builder: (context, snapshot) {
              //Some indication of activity for the user when delayed.
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              //Race detail display widget, for the body of selectedRace.
              else {
                return createRaceSelectedView(context, snapshot);
              }
            }));
  }

  //Search result display widget, with query as a parameter.
  Widget searchedRace(BuildContext context, String searchQuery) {
    return Scaffold(
        appBar: AppBar(
          title: Text(searchQuery),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchSearched method with parameter.
            future: fetchSearched(searchQuery, indexType),
            builder: (context, snapshot) {
              //Some indication of activity for the user when delayed.
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              //Race search result displayed in body of searchedRace.
              else {
                return createRaceListView(context, snapshot);
              }
            }));
  }

  //Race detail display widget, for the body of selectedRace.
  Widget createRaceSelectedView(BuildContext context, AsyncSnapshot snapshot) {
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

  //Race search result displayed in body of searchedRace.
  Widget createRaceListView(BuildContext context, AsyncSnapshot snapshot) {
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
              //When tapped, tile will load race details.
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            selectedRace(context, values[index])));
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
        title: new Text('Races'),
        actions: [searchBar.getSearchAction(context)]);
  }

  //When a search query is submitted, this method handles the input.
  onSubmitted(String value) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedRace(context, value)));
  }

  //SearchBar parameters set.
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

  //Build method for raceListState.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Custom AppBar used.
        appBar: searchBar.build(context),
        //Private key used.
        key: _scaffoldKey,
        body: FutureBuilder(
          //Future builder which calls the fetchSpells method.
            future: fetchEntries(jsonLocation),
            builder: (context, AsyncSnapshot snapshot) {
              //Some indication of activity for the user when delayed.
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              //Spell list displayed in body of build method.
              else {
                return createRaceListView(context, snapshot);
              }
            }));
  }
}
