import 'package:flutter_search_bar/flutter_search_bar.dart';

import 'Class.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClassList extends StatefulWidget {
  @override
  ClassListState createState() => ClassListState();
}

class ClassListState extends State<ClassList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String searchClass = "";

  List<String> listOfClassNames = new List();
  List<String> classDetails = new List();

  Future<String> _loadFromClassJson() async {
    return await rootBundle.loadString("data/sfrpg_classes.json");
  }

  Future<List<String>> fetchClass() async {
    String jsonString = await _loadFromClassJson();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    listOfClassNames = jsonResponses.keys.toList();
    return listOfClassNames;
  }

  Future<List<String>> fetchAClass(String className) async {
    String jsonString = await _loadFromClassJson();
    Class newClass = new Class();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newClass = Class.fromJson(jsonResponses[className]);
    newClass.name = className;
    classDetails = newClass.classDetails(newClass);
    return classDetails;
  }

  Future<List<String>> fetchSearched(String searchQuery) async {
    List<String> searchValues = new List();
    searchQuery.toLowerCase();
    List<String> tempList = listOfClassNames;
    tempList = tempList.map((e) => e.toLowerCase()).toList();
    for (var i = 0; i < listOfClassNames.length; i++) {
      if (tempList[i].contains(searchQuery)) {
        searchValues.add(listOfClassNames[i]);
        print(searchValues[0]);
      }
    }
    if (searchValues.isEmpty){
      searchValues.add("No results found!");
    }
    return searchValues;
  }

  Widget selectedClass(BuildContext context, String class1) {
    return Scaffold(
        appBar: AppBar(
          title: Text(class1),
        ),
        body: FutureBuilder(
            future: fetchAClass(class1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createClassSelectedView(context, snapshot);
              }
            }));
  }

  Widget searchedClass(BuildContext context, String searchQuery) {
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
                return createClassListView(context, snapshot);
              }
            }));
  }

  Widget createClassSelectedView(BuildContext context, AsyncSnapshot snapshot) {
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

  Widget createClassListView(BuildContext context, AsyncSnapshot snapshot) {
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
                            selectedClass(context, values[index])));
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
        title: new Text('Class'),
        actions: [searchBar.getSearchAction(context)]);
  }

  onSubmitted(String value) {
    /*setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));*/
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                searchedClass(context, value)));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: searchBar.build(context),
        key: _scaffoldKey,
        body: FutureBuilder(
            future: fetchClass(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createClassListView(context, snapshot);
              }
            }));
  }
}
