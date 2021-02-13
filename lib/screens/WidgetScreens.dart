import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'equipBoxes.dart';
import 'refBoxes.dart';
import 'playerBoxes.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class ExpandedPlayerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    var screenSize = MediaQuery
        .of(context)
        .size;
    var width = screenSize.width;
    var quarterWidth = width / 4;

    for (var i = 0; i < pConstNumOfButtons; i++) {
      switch (i) {
        case 0:
          children.add(new PlayerBox());
          break;
        case 1:
          children.add(new PlayerBox1());
          break;
        case 2:
          children.add(new PlayerBox2());
          break;
        case 3:
          children.add(new PlayerBox3());
          break;
        case 4:
          children.add(new PlayerBox4());
          break;
      }
    }
    // return new SingleChildScrollView(
    //   child: Container(
    //     width: width,
    //     height: containerHeightWithToolbar(context),
    //     padding: EdgeInsets.only(left: quarterWidth, right: quarterWidth),
    //     child: GridView.count(
    //       primary: false,
    //       padding: const EdgeInsets.all(20),
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //       crossAxisCount: 2,
    //       children: children,
    //     ),
    //   ),
    // );
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size;
  }

  double containerHeight(BuildContext context,
      {double containerHeight = constContainerHeight,
        double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / containerHeight;
  }

  double containerHeightWithToolbar(BuildContext context,
      {double newContainerHeight = constContainerHeight}) {
    return containerHeight(context,
        containerHeight: newContainerHeight, sizeReduction: kToolbarHeight);
  }
}

class PlayerScreen extends StatelessWidget {
  static const routeName = 'playerScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Player Options"),
        ),
        body: ExpandedPlayerBox());
  }
}

class ExpandedRefBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    var screenSize = MediaQuery
        .of(context)
        .size;
    var width = screenSize.width;
    var quarterWidth = width / 4;

    for (var i = 0; i < refConstNumOfButtons; i++) {
      switch (i) {
        case 0:
          children.add(new RefBox());
          break;
        case 1:
          children.add(new RefBox1());
          break;
        case 2:
          children.add(new RefBox2());
          break;
        case 3:
          children.add(new RefBox3());
          break;
        case 4:
          children.add(new RefBox4());
          break;
        case 5:
          children.add(new RefBox5());
          break;
        case 6:
          children.add(new RefBox6());
          break;
      }
    }
    // return new SingleChildScrollView(
    //   child: Container(
    //     width: width,
    //     height: containerHeightWithToolbar(context),
    //     padding: EdgeInsets.only(left: quarterWidth, right: quarterWidth),
    //     child: GridView.count(
    //       primary: false,
    //       padding: const EdgeInsets.all(20),
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //       crossAxisCount: 2,
    //       children: children,
    //     ),
    //   ),
    // );
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size;
  }

  double containerHeight(BuildContext context,
      {double containerHeight = constContainerHeight,
        double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / containerHeight;
  }

  double containerHeightWithToolbar(BuildContext context,
      {double newContainerHeight = constContainerHeight}) {
    return containerHeight(context,
        containerHeight: newContainerHeight, sizeReduction: kToolbarHeight);
  }
}

class RefScreen extends StatelessWidget {
  static const routeName = 'refScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("References"),
        ),
        body: ExpandedRefBox());
  }
}

class ExpandedEquipBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    var screenSize = MediaQuery
        .of(context)
        .size;
    var width = screenSize.width;
    var quarterWidth = width / 4;

    for (var i = 0; i < equipConstNumOfButtons; i++) {
      switch (i) {
        case 0:
          children.add(new EquipBox());
          break;
        case 1:
          children.add(new EquipBox1());
          break;
        case 2:
          children.add(new EquipBox2());
          break;
        case 3:
          children.add(new EquipBox3());
          break;
        case 4:
          children.add(new EquipBox4());
          break;
        case 5:
          children.add(new EquipBox5());
          break;
        case 6:
          children.add(new EquipBox6());
          break;
        case 7:
          children.add(new EquipBox7());
          break;
      }
    }
    // return new SingleChildScrollView(
    //   child: Container(
    //     width: width,
    //     height: containerHeightWithToolbar(context),
    //     padding: EdgeInsets.only(left: quarterWidth, right: quarterWidth),
    //     child: GridView.count(
    //       primary: false,
    //       padding: const EdgeInsets.all(20),
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //       crossAxisCount: 2,
    //       children: children,
    //     ),
    //   ),
    // );
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size;
  }

  double containerHeight(BuildContext context,
      {double containerHeight = constContainerHeight,
        double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / containerHeight;
  }

  double containerHeightWithToolbar(BuildContext context,
      {double newContainerHeight = constContainerHeight}) {
    return containerHeight(context,
        containerHeight: newContainerHeight, sizeReduction: kToolbarHeight);
  }
}

class EquipScreen extends StatelessWidget {
  static const routeName = 'equipScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Equipment"),
        ),
        body: ExpandedEquipBox());
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
                  future: DefaultAssetBundle.of(context).loadString(
                      'AssetManifest.json'),
                  builder: (context, snapshot) {
                    List<String> files = getFileData(snapshot.data);
                    return files.isNotEmpty ? new DataPageBuilder(
                        fileData: files) : new Center(
                        child: CircularProgressIndicator());
                  }),
            )
        )
      //children: assembleData(context),
      //child: Text('Spells go here'),
    );
  }

  List<String> getFileData(String data) {
    if (data == null) {
      return [];
    }
    List<String> parsedData = [];
    Map<String, dynamic> mapData = json.decode(data);
    // parsedData = json.decode(data).keys.where((String key) {
    //   return key.startsWith('/assets/GameMastering');
    // }).toList();
    parsedData = mapData.keys.where((String key) {
      return key.startsWith('data/GameMastering/');
    }).toList();
    for (int i = 0; i < parsedData.length; i++) {
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
      onMessageReceived: (JavascriptMessage message) async {
        String pageBody = message.message;
        pageBody.split(",");
        List<String> parsedData = pageBody.split(",");
        print('page body: $pageBody');
        parsedData.forEach((element) {
          print(element);
        });

        writeContent(pageBody);
      },
    );
  }

  Future<String> get _localPath async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    Directory directory = await new Directory(
        appDocDirectory.path + '/' + 'CharacterSheets')
        .create(recursive: true)
        .then(
            (Directory directory) {
          print('Path of New Dir: ' + directory.path);
          return directory;
        });
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('$path' + '/savedCharacterSheet.json');
    return File('$path' + '/savedCharacterSheet.json');
    print('$path' + '/savedCharacterSheet.html');
    return File('$path' + '/savedCharacterSheet.html');
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

class DataPageBuilder extends StatelessWidget {
  final List<String> fileData;

  DataPageBuilder({Key key, this.fileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: fileData == null ? 0 : fileData.length,
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
                    MaterialPageRoute(builder: (context) =>
                        InfoPageBuilder(fileText: fileData[index])),
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
            builder: (context, snapshot) {
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

class DirectoryTest extends StatefulWidget {
  const DirectoryTest({Key key}) : super(key: key);

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
            String pageData = await localContent();
            await loadHtmlFromAssets(pageData, _controller);
          },
        ),
      ),
    );
  }

  Future<void> loadHtmlFromAssets(String fileName, controller) async {
    //String fileText = await rootBundle.loadString(fileName);
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

  JavascriptChannel _loadDataJSChannel(BuildContext context,
      WebViewController webviewController) {
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

    Directory directory = await new Directory(
        appDocDirectory.path + '/' + 'CharacterSheets')
        .create(recursive: true)
        .then(
            (Directory directory) {
          print('Path of New Dir: ' + directory.path);
          return directory;
        });
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('$path' + '/savedCharacterSheet.json');
    return File('$path' + '/savedCharacterSheet.json');
    print('$path' + '/savedCharacterSheet.html');
    return File('$path' + '/savedCharacterSheet.html');
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
            builder: (context, snapshot) {
              List<String> values = fetchSavedFiles(snapshot.toString());
              return ListView.builder(
                  itemCount: values == null ? 0 : values.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new ListTile(
                      title: new Text(values[index]),
                      onTap: () {
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

    Directory directory = await new Directory(
        appDocDirectory.path + '/' + 'CharacterSheets')
        .create(recursive: true)
        .then(
            (Directory directory) {
          print('Path of New Dir: ' + directory.path);
          return directory;
        });
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('$path' + '/savedCharacterSheet.json');
    return File('$path' + '/savedCharacterSheet.json');
  }

  Future<String> localContent() async {
    final file = await _localFile;
    String localContent = await file.readAsString();
    return localContent;
  }

}