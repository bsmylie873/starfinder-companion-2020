import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'spell.dart';

class CharacterGeneration extends StatelessWidget {
  static const routeName = 'character';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Generation"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Testing'),
        ),
      ),
    );
  }
}

class RaceIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Races"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Testing'),
        ),
      ),
    );
  }
}

class ClassIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Classes"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Classes go here'),
        ),
      ),
    );
  }
}

class SkillIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character skills"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Skills go here'),
        ),
      ),
    );
  }
}

class MagicIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spells and Magic"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Spells go here'),
        ),
      ),
    );
  }
}

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
    return FutureBuilder(
        future: fetchASpell(spell),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return createSpellSelectedView(context, snapshot);
          }
        });
  }

  Widget createSpellSelectedView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values1 = snapshot.data;
    return new ListView.builder(
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
    );
  }

  /*Widget createSpellListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index]),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SpellInfoPageBuilder(spellTitle: values[index])),
                )
              },
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }*/

  Widget createSpellListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index]),
              onTap: () => {selectedSpell(context, values[index])},
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































class SpellInfoPageBuilder extends StatelessWidget {
  final String spellTitle;

  SpellInfoPageBuilder({Key key, this.spellTitle}) : super(key: key);

  Widget createSpellDetailsView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.builder(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(spellTitle),
        ),
        body: FutureBuilder(
            future: fetchASpell(spellTitle),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                // return selectedSpell(context, snapshot.data.toString());
                return createSpellDetailsView(context, snapshot);
              }
            }));
  }


  Future<String> _loadFromSpellJson() async {
    return await rootBundle.loadString("data/starfinderMagicAndSpells.json");
  }

  Future<List<String>> fetchASpell(String spellName) async {
    String jsonString = await _loadFromSpellJson();
    Spell newSpell = new Spell();
    Map<String, dynamic> jsonResponses = jsonDecode(jsonString);
    newSpell = Spell.fromJson(jsonResponses[spellName]);
    newSpell.name = spellName;
    List<String> spellDetails = newSpell.spellDetails(newSpell);
    return spellDetails;
    // return newSpell;
  }

  Future<List<String>> parseSpell(Spell spell) async {
    List<String> spellDetails = spell.spellDetails(spell);
    return spellDetails;
  }
}

class GMRules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Mastering Info."),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Game mastering rules go here'),
        ),
      ),
    );
  }
}

class CharacterSheetAttempt extends StatelessWidget {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Sheet')),
      body: WebView(
          initialUrl: '',
          onWebViewCreated: (WebViewController webViewController) async {
            _controller = webViewController;
            await loadHtmlFromAssets('data/characterSheet.html', _controller);
          }),
    );
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
