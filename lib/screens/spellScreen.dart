import '../objects/spell.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

//Stateful SpellList class.
class SpellList extends StatefulWidget {
  @override
  SpellListState createState() => SpellListState();
}

//State of stateful SpellList class.
class SpellListState extends State<SpellList> {
  //Scaffold key used for SearchBar declared.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //List of strings for different fetch methods initialised.
  List<String> listOfSpellNames = new List();
  List<String> spellDetails = new List();

  //Json data loaded into a Future of type String.
  Future<String> _loadFromSpellJson() async {
    return await rootBundle.loadString("data/sfrpg_spells.json");
  }

  //This method creates a string list of all spells.
  Future<List<String>> fetchSpells() async {
    String jsonString = await _loadFromSpellJson();
    //Future String parsed into a map.
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    //Keys extracted from map (spell names).
    listOfSpellNames = jsonResponses.keys.toList();
    return listOfSpellNames;
  }

  //This method fetches the details of a single spell.
  Future<List<String>> fetchASpell(String spellName) async {
    String jsonString = await _loadFromSpellJson();
    //Spell object created.
    Spell newSpell = new Spell();
    //Future of type string parsed into a map.
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    //NewSpell takes values from matching entry in jsonResponses map.
    newSpell = Spell.fromJson(jsonResponses[spellName]);
    newSpell.name = spellName;
    //List of strings takes values from newSpell and then returned.
    spellDetails = newSpell.spellDetails(newSpell);
    return spellDetails;
  }

  Future<List<String>> fetchSearched(String searchQuery) async {
    //List of strings created.
    List<String> searchValues = new List();
    //Parameter converted to lower case.
    searchQuery.toLowerCase();
    //Temporary list allowed to equal key list.
    List<String> tempList = listOfSpellNames;
    //Temporary list set to lower case.
    tempList = tempList.map((e) => e.toLowerCase()).toList();
    //Sequential search of temporary list with search query.
    for (var i = 0; i < listOfSpellNames.length; i++) {
      if (tempList[i].contains(searchQuery)) {
        searchValues.add(listOfSpellNames[i]);
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

  //Spell detail display widget, with a spell as a parameter.
  Widget selectedSpell(BuildContext context, String spell) {
    return Scaffold(
        appBar: AppBar(
          title: Text(spell),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchASpell method with parameter.
            future: fetchASpell(spell),
            builder: (context, snapshot) {
              //Some indication of activity for the user when delayed.
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              //Spell detail display widget, for the body of selectedSpell.
              else {
                return createSpellSelectedView(context, snapshot);
              }
            }));
  }

  //Search result display widget, with query as a parameter.
  Widget searchedSpell(BuildContext context, String searchQuery) {
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
              //Spell search result displayed in body of searchedSpell.
              else {
                return createSpellListView(context, snapshot);
              }
            }));
  }

  //Spell detail display widget, for the body of selectedSpell.
  Widget createSpellSelectedView(BuildContext context, AsyncSnapshot snapshot) {
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

  //Spell search result displayed in body of searchedSpell.
  Widget createSpellListView(BuildContext context, AsyncSnapshot snapshot) {
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
              //When tapped, tile will load spell details.
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            selectedSpell(context, values[index])));
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
        title: new Text('Spells'),
        actions: [searchBar.getSearchAction(context)]);
  }

  //When a search query is submitted, this method handles the input.
  onSubmitted(String value) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedSpell(context, value)));
  }

  //SearchBar parameters set.
  SpellListState() {
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

  //Build method for spellListState.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Custom AppBar used.
        appBar: searchBar.build(context),
        //Private key used.
        key: _scaffoldKey,
        body: FutureBuilder(
          //Future builder which calls the fetchSpells method.
            future: fetchSpells(),
            builder: (context, AsyncSnapshot snapshot) {
              //Some indication of activity for the user when delayed.
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              //Spell list displayed in body of build method.
              else {
                return createSpellListView(context, snapshot);
              }
            }));
  }
}
