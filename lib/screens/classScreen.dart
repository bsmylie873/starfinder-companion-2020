//CONTRIBUTION - BRANDON 80% CONOR 20%

import '../config/constants/enums.dart';
import '../utilities/jsonUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

//Stateful ClassList class.
class ClassList extends StatefulWidget {
  @override
  ClassListState createState() => ClassListState();
}

//State of stateful ClassList class.
class ClassListState extends State<ClassList> {
  //Scaffold key used for SearchBar declared.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //Store location of JSON data.
  final String jsonLocation = "data/sfrpg_classes.json";
  //Index type identifies which index is being processed.
  indexType classEnum = indexType.CLASS;

  //List of strings for fetch class details.
  List<String> classDetails = new List();

  //Class detail display widget, with a class as a parameter.
  Widget selectedClass(BuildContext context, String class1) {
    return Scaffold(
        appBar: AppBar(
          title: Text(class1),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchAClass method with parameter.
            future: fetchAnEntry(jsonLocation, classEnum, class1, classDetails),
            builder: (context, snapshot) {
              //Some indication of activity for the user when delayed.
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              //Class detail display widget, for the body of selectedClass.
              else {
                return createClassSelectedView(context, snapshot);
              }
            }));
  }

  //Search result display widget, with query as a parameter.
  Widget searchedClass(BuildContext context, String searchQuery) {
    return Scaffold(
        appBar: AppBar(
          title: Text(searchQuery),
        ),
        body: FutureBuilder(
          //Future builder which calls the fetchSearched method with parameter.
            future: fetchSearched(searchQuery, classEnum),
            builder: (context, snapshot) {
              //Some indication of activity for the user when delayed.
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              //Class search result displayed in body of searchedClass.
              else {
                return createClassListView(context, snapshot);
              }
            }));
  }

  //Class detail display widget, for the body of selectedClass.
  Widget createClassSelectedView(BuildContext context, AsyncSnapshot snapshot) {
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

  //Class search result displayed in body of searchedClass.
  Widget createClassListView(BuildContext context, AsyncSnapshot snapshot) {
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
              //When tapped, tile will load class details.
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            selectedClass(context, values[index])));
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
        title: new Text('Class'),
        actions: [searchBar.getSearchAction(context)]);
  }

  //When a search query is submitted, this method handles the input.
  onSubmitted(String value) {
    /*setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));*/
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedClass(context, value)));
  }

  //SearchBar parameters set.
  ClassListState() {
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
          //Future builder which calls the fetchClasses method.
            future: fetchEntries(jsonLocation),
            builder: (context, AsyncSnapshot snapshot) {
              //Some indication of activity for the user when delayed.
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              //Class list displayed in body of build method.
              else {
                return createClassListView(context, snapshot);
              }
            }));
  }
}
