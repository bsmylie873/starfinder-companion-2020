import 'spell.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpellList extends StatefulWidget {
  @override
  SpellListState createState() => SpellListState();
}

class SpellListState extends State<SpellList> {
  Future<String> _loadFromSpellJson() async {
    return await rootBundle.loadString("data/starfinderMagicAndSpells.json");
  }

  Future<List<String>> fetchSpells() async {
    String jsonString = await _loadFromSpellJson();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    List<String> spells = jsonResponses.keys.toList();
    return spells;
  }

  Future<List<String>> fetchASpell(String spellName) async {
    String jsonString = await _loadFromSpellJson();
    Spell newSpell = new Spell();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newSpell = Spell.fromJson(jsonResponses[spellName]);
    newSpell.name = spellName;
    List<String> spellDetails = new List();
    spellDetails = newSpell.spellDetails(newSpell);
    return await spellDetails;
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
            }
        )
    );
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
        }
    );
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
                    MaterialPageRoute(builder: (context) => selectedSpell(context, values[index]))
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
          title: Text("Spells"),
        ),
        body: FutureBuilder(
            future: fetchSpells(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                // return selectedSpell(context, snapshot.data.toString());
                return createSpellListView(context, snapshot);
              }
            }));
  }
}