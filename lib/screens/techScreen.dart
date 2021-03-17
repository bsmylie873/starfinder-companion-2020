//CONTRIBUTION - BRANDON 100% CONOR 0%

import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

//THIS CLASS REMAINS UNIMPLEMENTED DUE TO LACK OF DATA. THERE ARE NO COMMENTS.

class TechList extends StatefulWidget {
  @override
  TechListState createState() => TechListState();
}

class TechListState extends State<TechList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  /*List<String> listOfActionNames = new List();
  List<String> actionDetails = new List();

  Future<String> _loadFromActionJson() async {
    return await rootBundle.loadString("data/sfrpg_spells.json");
  }

  Future<List<String>> fetchActions() async {
    String jsonString = await _loadFromActionJson();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    listOfActionNames = jsonResponses.keys.toList();
    return listOfActionNames;
  }

  Future<List<String>> fetchAnAction(String actionName) async {
    String jsonString = await _loadFromActionJson();
    Action newAction = new Action();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newAction = Action.fromJson(jsonResponses[actionName]);
    newAction.name = actionName;
    actionDetails = newAction.spellDetails(newAction);
    return actionDetails;
  }

  Future<List<String>> fetchSearched(String searchQuery) async {
    List<String> searchValues = new List();
    searchQuery.toLowerCase();
    List<String> tempList = listOfActionNames;
    tempList = tempList.map((e) => e.toLowerCase()).toList();
    for (var i = 0; i < listOfActionNames.length; i++) {
      if (tempList[i].contains(searchQuery)) {
        searchValues.add(listOfActionNames[i]);
        print(searchValues[0]);
      }
    }
    if (searchValues.isEmpty){
      searchValues.add("No results found!");
    }
    return searchValues;
  }

  Widget selectedAction(BuildContext context, String action) {
    return Scaffold(
        appBar: AppBar(
          title: Text(action),
        ),
        body: FutureBuilder(
            future: fetchAnAction(action),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createActionSelectedView(context, snapshot);
              }
            }));
  }

  Widget searchedAction(BuildContext context, String searchQuery) {
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
                return createActionListView(context, snapshot);
              }
            }));
  }

  Widget createActionSelectedView(BuildContext context, AsyncSnapshot snapshot) {
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

  Widget createActionListView(BuildContext context, AsyncSnapshot snapshot) {
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
                            selectedAction(context, values[index])));
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

  */

  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Technological Items(To be implemented!)'),
        actions: [searchBar.getSearchAction(context)]);
  }

  /*onSubmitted(String value) {
    */ /*setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));*/ /*
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedAction(context, value)));
  }*/

  TechListState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        //onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
        appBar: searchBar.build(context),
        key: _scaffoldKey,
        body: FutureBuilder(
            future: fetchActions(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createActionListView(context, snapshot);
              }
            }));
  }*/

    return Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
    );
  }
}