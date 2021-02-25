import '../objects/spell.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class SpellList extends StatefulWidget {
  @override
  SpellListState createState() => SpellListState();
}

class SpellListState extends State<SpellList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String searchSpell = "";

  List<String> listOfSpellNames = new List();
  List<String> spellDetails = new List();

  Future<String> _loadFromSpellJson() async {
    return await rootBundle.loadString("data/sfrpg_spells.json");
  }

  Future<List<String>> fetchSpells() async {
    String jsonString = await _loadFromSpellJson();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    listOfSpellNames = jsonResponses.keys.toList();
    return listOfSpellNames;
  }

  Future<List<String>> fetchASpell(String spellName) async {
    String jsonString = await _loadFromSpellJson();
    Spell newSpell = new Spell();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newSpell = Spell.fromJson(jsonResponses[spellName]);
    newSpell.name = spellName;
    spellDetails = newSpell.spellDetails(newSpell);
    return spellDetails;
  }

  Future<List<String>> fetchSearched(String searchQuery) async {
    List<String> searchValues = new List();
    searchQuery.toLowerCase();
    List<String> tempList = listOfSpellNames;
    tempList = tempList.map((e) => e.toLowerCase()).toList();
    for (var i = 0; i < listOfSpellNames.length; i++) {
      if (tempList[i].contains(searchQuery)) {
        searchValues.add(listOfSpellNames[i]);
        print(searchValues[0]);
      }
    }
    if (searchValues.isEmpty){
      searchValues.add("No results found!");
    }
    return searchValues;
  }

  Widget selectedSpell(BuildContext context, String spell) {
    return Scaffold(
        appBar: AppBar(
          title: Text(spell),
        ),
        body: FutureBuilder(
            future: fetchASpell(spell),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createSpellSelectedView(context, snapshot);
              }
            }));
  }

  Widget searchedSpell(BuildContext context, String searchQuery) {
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
                return createSpellListView(context, snapshot);
              }
            }));
  }

  Widget createSpellSelectedView(BuildContext context, AsyncSnapshot snapshot) {
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

  Widget createSpellListView(BuildContext context, AsyncSnapshot snapshot) {
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
                            selectedSpell(context, values[index])));
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
        title: new Text('Spells'),
        actions: [searchBar.getSearchAction(context)]);
  }

  onSubmitted(String value) {
    /*setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));*/
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedSpell(context, value)));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: searchBar.build(context),
        key: _scaffoldKey,
        body: FutureBuilder(
            future: fetchSpells(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createSpellListView(context, snapshot);
              }
            }));
  }
}
