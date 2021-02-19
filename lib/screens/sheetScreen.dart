import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';




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
          _loadDataJSChannel(context, _controller),
        ].toSet(),

        initialUrl: '',
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController;
          await loadHtmlFromAssets('data/characterSheet.html', _controller);
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final File file  = await _localFile;
          String result = await file.readAsString();
          _controller.evaluateJavascript("LoadJSON($result)");

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

  JavascriptChannel _loadDataJSChannel(BuildContext context,
      WebViewController webviewController) {
    return JavascriptChannel(
      name: 'loadJson',
      onMessageReceived: (JavascriptMessage message) async {
        final File file  = await _localFile;
        List<String> result = file.readAsLinesSync();
        _controller.evaluateJavascript("LoadJSON($result)");
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
    print('$path');
    return File('$path');
    // print('$path' + '/savedCharacterSheet.json');
    // return File('$path' + '/savedCharacterSheet.json');
  }

  Future<File> writeContent(String content) async {
    final file = await _localFile;
    Map<String, dynamic> tempMap = json.decode(content);

    // String charName = tempMap.keys.where((String key) {
    //   String value = key.endsWith("Charname");
    // }).toString();
    String charName = tempMap["Charname"];
    RegExp noBadCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    final cleanName = noBadCharacters.firstMatch(charName);
    charName = cleanName.group(0);
    // Write the file
    if(charName.isNotEmpty) {
      final writeFile = new File(file.path + '/'+ '$charName' + '.json');
      print(writeFile.writeAsString(content));
      return writeFile.writeAsString(content);
    }
    else{
      final writeFile = new File(file.path + '/savedCharacterSheet.json');
      print(writeFile.writeAsString(content));
      return writeFile.writeAsString(content);
    }
  }


  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}


class DirectoryTest extends StatelessWidget {
  DirectoryTest({Key key,  this.path}) : super(key: key);
  String path;
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Sheet"),
      ),
      body: Center(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: <JavascriptChannel>[
            _extractDataJSChannel(context),

          ].toSet(),
          initialUrl: '',
          onWebViewCreated: (WebViewController webViewController) async {
            _controller = webViewController;
            await loadHtmlFromAssets('data/characterSheet.html', _controller);
          },
          onPageFinished: (String data) async{
            String savedFile  = await localContent(path);
            _controller.evaluateJavascript("LoadJSON($savedFile)");
          },
        ),
      ),
    );
  }

  Future<void> loadHtmlFromAssets(String fileName, controller) async {
    String fileText = await rootBundle.loadString(fileName);
    controller.loadUrl(Uri.dataFromString(fileText,
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
    print('$path');
    return File('$path');
  }

  Future<File> writeContent(String content) async {
    final file = await _localFile;
    Map<String, dynamic> tempMap = json.decode(content);
    String charName = tempMap["Charname"];
    RegExp noBadCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    final cleanName = noBadCharacters.firstMatch(charName);
    charName = cleanName.group(0);
    // Write the file
    if(charName.isNotEmpty) {
      final writeFile = new File(file.path + '/'+ '$charName' + '.json');
      print(writeFile.writeAsString(content));
      return writeFile.writeAsString(content);
    }
    else{
      final writeFile = new File(file.path + '/savedCharacterSheet.json');
      print(writeFile.writeAsString(content));
      return writeFile.writeAsString(content);
    }
  }

  Future<String> localContent(String path) async {
    final file = new File(path);
    String localContent = await file.readAsString();
    return localContent;
  }
}

class FileGridView extends StatefulWidget{
  @override
  _FileGridViewState createState() => _FileGridViewState();
}

class _FileGridViewState extends State<FileGridView>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FutureBuilder(
          future: _localPath,
          builder: (context, snapshot) {
            String path =  snapshot.data;
            Directory directory = new Directory(path);
            return directory.existsSync() ? new CharacterSheetDirectory(directory: directory): new Center(
                child: CircularProgressIndicator());
          },
        ),
      ),
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

}


class CharacterSheetDirectory extends StatelessWidget {
  final Directory directory;

  const CharacterSheetDirectory({Key key, this.directory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fileList = directory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".json"))
        .toList(growable: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Character Sheets"),
      ),
      body: ListView.builder(
          itemCount: fileList == null ? 0 : fileList.length,
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            File file = new File(fileList[index]);
            String name = file.path
                .split('/')
                .last;
            return new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    title: Text(name),
                    onTap: () =>
                    {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return DirectoryTest(path: file.path);
                      },
                      )
                      )
                    },
                    trailing: IconButton(
                      icon: Icon(CupertinoIcons.trash),
                      onPressed: () {
                        showAlertDialog(context, file);
                      },

                     ),
                  )
              ),
            );
          }),
    );
  }
  showAlertDialog(BuildContext context, File file) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
      },
    );
    Widget deleteButton = FlatButton(
      child: Text("Delete"),
      onPressed:  () {
      file.deleteSync(recursive: false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("If you wish to delete the associated sheet, press Delete. To dismiss this dialog, press Cancel"),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
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
  }

  Future<String> localContent() async {
    final file = await _localFile;
    String localContent = await file.readAsString();
    return localContent;
  }

}
