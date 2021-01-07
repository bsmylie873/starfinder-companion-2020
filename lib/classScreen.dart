import 'class.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClassIndex extends StatefulWidget {
  ClassIndexState createState() => ClassIndexState();
}

class ClassIndexState extends State<ClassIndex> {
  String _searchText = "";
  final TextEditingController _filter = new TextEditingController();
  List filteredClasses = new List();

  Future<String> _loadFromClassJson() async {
    return await rootBundle.loadString("data/sfrpg_classes.json");
  }

  Future<List<String>> fetchClasses() async {
    String jsonString = await _loadFromClassJson();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    List<String> classes = jsonResponses.keys.toList();
    return classes;
  }

  Future<List<String>> fetchAClass(String className) async {
    String jsonString = await _loadFromClassJson();
    Class newClass = new Class();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newClass = Class.fromJson(jsonResponses[className]);
    newClass.name = className;
    List<String> classDetails = new List();
    classDetails = newClass.classDetails(newClass);
    print(classDetails);
    return await classDetails;
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
            }
        )
    );
  }

  Widget createClassSelectedView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.separated(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(values[index]),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        }
    );
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
                    MaterialPageRoute(builder: (context) => selectedClass(context, values[index]))
                );
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Classes"),
        ),
        body: FutureBuilder(
            future: fetchClasses(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createClassListView(context, snapshot);
              }
            }));
  }
}