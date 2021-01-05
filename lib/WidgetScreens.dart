import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'class.dart';
import 'race.dart';
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

class ClassIndex extends StatefulWidget {
  ClassIndexState createState() => ClassIndexState();
}

class ClassIndexState extends State<ClassIndex> {
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
          title: Text("Races"),
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
        title: Text("Trying to read JSON files"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('AssetManifest.json'),
            builder: (context, snapshot) {
              List<String> files = getFileData(snapshot.data);
              return files.isNotEmpty ? new DataPageBuilder(fileData: files) : new Center(child: CircularProgressIndicator());
            }),
          )
        )
        //children: assembleData(context),
          //child: Text('Spells go here'),
    );
  }

  List<String> getFileData(String data) {
    if(data == null){
      return [];
    }
    List<String> parsedData = [];
    Map<String, dynamic> mapData = json.decode(data);
    // parsedData = json.decode(data).keys.where((String key) {
    //   return key.startsWith('/assets/GameMastering');
    // }).toList();
    parsedData = mapData.keys.where((String key) {
      return key.startsWith('assets/GameMastering/');
    }).toList();
    for(int i = 0; i< parsedData.length; i++){
    parsedData[i] = parsedData[i].replaceAll("%20", " ");
    }
    return parsedData;
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
          await loadHtmlFromAssets('assets/characterSheet.html', _controller);
        }
      ),
    );
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}

class DataPageBuilder extends StatelessWidget{
  final List<String> fileData;
  DataPageBuilder({Key key, this.fileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: fileData == null ? 0: fileData.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: Container(
              child: ListTile(
                title: Text(
                  fileData[index],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPageBuilder(fileText: fileData[index])),
                  );
                },
              ),
              padding: const EdgeInsets.all(15.0),
            ),

          );
        }
    );
  }
}



class InfoPageBuilder extends StatelessWidget {
  final String fileText;
  InfoPageBuilder({Key key, this.fileText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(fileText),
        ),
        body: FutureBuilder(
      future: getFileText(context, fileText),
      builder: (context, snapshot){
        return SingleChildScrollView(
          child: Text(
            snapshot.data.toString(),
            style: TextStyle(fontSize: 16),
        )
        );
      }
    )
    );
  }

  Future<String> getFileText(BuildContext context, String filePath) async {
    String fileText = await DefaultAssetBundle.of(context).loadString(filePath);
    return fileText;
  }
}