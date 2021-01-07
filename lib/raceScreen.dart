import 'race.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RaceIndex extends StatefulWidget {
  @override
  RaceIndexState createState() => RaceIndexState();
}

class RaceIndexState extends State<RaceIndex> {
  Future<String> _loadFromRaceJson() async {
    return await rootBundle.loadString("data/sfrpg_races.json");
  }

  Future<List<String>> fetchRaces() async {
    String jsonString = await _loadFromRaceJson();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    List<String> races = jsonResponses.keys.toList();
    return races;
  }

  Future<List<String>> fetchARace(String raceName) async {
    String jsonString = await _loadFromRaceJson();
    Race newRace = new Race();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newRace = Race.fromJson(jsonResponses[raceName]);
    newRace.name = raceName;
    List<String> raceDetails = new List();
    raceDetails = newRace.raceDetails(newRace);
    print(raceDetails);
    return await raceDetails;
  }

  Widget selectedRace(BuildContext context, String race) {
    return Scaffold(
        appBar: AppBar(
          title: Text(race),
        ),
        body: FutureBuilder(
            future: fetchARace(race),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return createRaceSelectedView(context, snapshot);
              }
            }
        )
    );
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
        }
    );
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
                    MaterialPageRoute(builder: (context) => selectedRace(context, values[index]))
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
          title: Text("Races"),
        ),
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