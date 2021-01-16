import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'spell.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

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
    /*return Scaffold(
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
    );*/
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
    return new ListView.builder(
      itemCount: values1.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              subtitle: new Text(values1[index]),
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
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: <JavascriptChannel>[
          _extractDataJSChannel(context),
        ].toSet(),

        initialUrl: '',
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController;
          await loadHtmlFromAssets('data/characterSheet.html', _controller);
        },
      ),
    );
  }

  JavascriptChannel _extractDataJSChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Flutter',
      onMessageReceived: (JavascriptMessage message) {
        String pageBody = message.message;
        print('page body: $pageBody');
        writeContent(pageBody);
      },
    );
  }

  Future<String> get _localPath async {

    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    Directory directory = await new Directory(appDocDirectory.path+'/'+'CharacterSheets').create(recursive: true).then(
            (Directory directory) {
      print('Path of New Dir: '+directory.path);
      return directory;
    });
    return directory.path;

  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('$path'+ '/savedCharacterSheet.json');
    return File('$path'+ '/savedCharacterSheet.json');
  }

  Future<File> writeContent(String content) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString(content);
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

class DirectoryTest extends StatefulWidget{
  const DirectoryTest({Key key}): super(key: key);
  @override
  _DirectoryTestState createState() => _DirectoryTestState();
}


class _DirectoryTestState extends State<DirectoryTest> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spells and Magic"),
      ),
      body: Center(
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: <JavascriptChannel>[
                    _extractDataJSChannel(context),
                    _loadDataJSChannel(context, _controller)
                  ].toSet(),
                  initialUrl: '',
                  onWebViewCreated: (WebViewController webViewController) async {
                    String data = await localContent();
                    _controller = webViewController;

                    await loadHtmlFromAssets(data, _controller);
                  },
                ),
              ),
            );
  }

  Future<void> loadHtmlFromAssets(String fileName, controller) async {
    controller.loadUrl(Uri.dataFromString(fileName,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  JavascriptChannel _extractDataJSChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Flutter',
      onMessageReceived: (JavascriptMessage message) {
        String pageBody = message.message;
        print('page body: $pageBody');
        writeContent(pageBody);
      },
    );
  }
  JavascriptChannel _loadDataJSChannel(BuildContext context, WebViewController webviewController) {
    return JavascriptChannel(
      name: 'loadJson',
      onMessageReceived: (JavascriptMessage message) async {
        final result = await Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => CharacterSheetDirectory(),
          ),
        );
        webviewController.evaluateJavascript('LoadJSON($result)');
      },
    );
  }

  Future<String> get _localPath async {

    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    Directory directory = await new Directory(appDocDirectory.path+'/'+'CharacterSheets').create(recursive: true).then(
            (Directory directory) {
          print('Path of New Dir: '+directory.path);
          return directory;
        });
    return directory.path;

  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('$path'+ '/savedCharacterSheet.json');
    return File('$path'+ '/savedCharacterSheet.json');
  }

  Future<File> writeContent(String content) async {
    final file = await _localFile;
    // Write the file
    print(file.writeAsString(content));
    return file.writeAsString(content);
  }

  Future<String> localContent() async {
    final file = await _localFile;
    String localContent = await file.readAsString();
    return localContent;
  }


}

class CharacterSheetDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Character Sheets"),
      ),
      body: FutureBuilder(
        future: _localPath,
        builder: (context, snapshot){
          List<String> values = fetchSavedFiles(snapshot.toString());
          return ListView.builder(
              itemCount: values == null ? 0: values.length,
              itemBuilder: (BuildContext context, int index){
              return new ListTile(
                title: new Text(values[index]),
                onTap: (){
                  Navigator.pop(context, values[index]);
                },
              );

        });
        }
      )
    );
  }

  List<String> fetchSavedFiles(String snapshot) {
    List<String> savedFiles;
    Stream<FileSystemEntity> testing;
    Directory savedFileDirectory = Directory('$snapshot');
      testing = savedFileDirectory.list(recursive: true, followLinks: false);
      savedFiles[0] = testing.toString();
      return savedFiles;
  }

  Future<String> get _localPath async {

    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    Directory directory = await new Directory(appDocDirectory.path+'/'+'CharacterSheets').create(recursive: true).then(
            (Directory directory) {
          print('Path of New Dir: '+directory.path);
          return directory;
        });
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('$path'+ '/savedCharacterSheet.json');
    return File('$path'+ '/savedCharacterSheet.json');
  }

  Future<String> localContent() async {
    final file = await _localFile;
    String localContent = await file.readAsString();
    return localContent;
  }

}