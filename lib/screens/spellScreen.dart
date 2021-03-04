import '../enums.dart';
import '../jsonUtil.dart';
import 'package:flutter/material.dart';
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
  //Store location of JSON data.
  final String jsonLocation = "data/sfrpg_spells.json";
  //Index type identifies which index is being processed.
  indexType spellEnum = indexType.SPELL;

  //List of strings for fetch spell details.
  List<String> spellDetails = new List();

  //Spell detail display widget, with a spell as a parameter.
  Widget selectedSpell(BuildContext context, String spell) {
    return Scaffold(
        appBar: AppBar(
          title: Text(spell),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchASpell method with parameter.
            future: fetchAnEntry(jsonLocation, spellEnum, spell, spellDetails),
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
            future: fetchSearched(searchQuery, spellEnum),
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
            future: fetchEntries(jsonLocation),
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
