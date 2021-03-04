import 'dart:convert';
import 'dart:io';
import 'mainBoxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

//Flexible class, displays and allows interaction with
// the Character Sheet and Ship Sheet HTML files using
// Flutter Webview
class PlayerSheetPage extends StatelessWidget {
  PlayerSheetPage({Key key, this.path}) : super(key: key);

  //Path to the Character/Ship sheet, passed as a variable to determine which
  //sheet to load
  String path;

  //Declaring the controller here allows functions outside of the build
  //method to interact with the controller once initialised
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    //This enables a hybrid Flutter and native Android webview
    //if platform is Android
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Character Sheet')),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: <JavascriptChannel>[
          //Javascript Channel to save information sent back from sheet
          _extractDataJSChannel(context),
          //Javascript Channel to handle sheet-side load file request
          _loadDataJSChannel(context, _controller),
        ].toSet(),
        initialUrl: '',
        //When webview is initialised, fetches the data from the sheet passed
        //using the path variable.
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController;
          await loadHtmlFromAssets(path, _controller);
        },
      ),
    );
  }

  JavascriptChannel _extractDataJSChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Flutter',
      onMessageReceived: (JavascriptMessage message) async {
        String pageBody = message.message;
        //Code for debugging, displays the content sent back from the sheet
        // pageBody.split(",");
        // List<String> parsedData = pageBody.split(",");
        // print('page body: $pageBody');
        // parsedData.forEach((element) {
        //   print(element);
        // });
        //Writes the JSON file sent back from the sheet to a file, needs path
        //variable so that it knows which directory to write to, Ship/Character
        writeContent(pageBody, path);
      },
    );
  }

  JavascriptChannel _loadDataJSChannel(
      BuildContext context, WebViewController webviewController) {
    return JavascriptChannel(
        name: 'loadJson',
        onMessageReceived: (JavascriptMessage message) async {
          //Checks if the sheet path is Character or Ship and loads from directory
          String directoryPath;
          if (path.contains('data/characterSheet.html')) {
            directoryPath = await _localPath;
          } else {
            directoryPath = await _localShipPath;
          }
          //Uses directory to route to the load sheet page, shows all files saved
          //at the specified directory, which pops back information when a tile on
          //that screen is pressed
          Directory loadingSheetDirectory = new Directory(directoryPath);
          String filePath = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoadSheetPage(directory: loadingSheetDirectory)));
          //Loads data from popped file path and inserts values from sheet
          //using the controller to execute the LoadJSON method
          if (filePath != null) {
            String result = await localContent(filePath);
            _controller.evaluateJavascript("LoadJSON($result)");
          } else {
            print("Non-existent or no file selected");
          }
        });
  }

  //Loads data from a file at the passed path
  Future<String> localContent(String path) async {
    final file = new File(path);
    String localContent = await file.readAsString();
    return localContent;
  }

  //Gets the character sheet directory
  Future<String> get _localPath async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory directory =
    await new Directory(appDocDirectory.path + '/' + 'CharacterSheets')
        .create(recursive: true)
        .then((Directory directory) {
      print('Path of New Dir: ' + directory.path);
      return directory;
    });
    return directory.path;
  }

  //Makes a file at path returned from local path
  Future<File> get _localFile async {
    final path = await _localPath;
    print('$path');
    return File('$path');
  }

  Future<File> writeContent(String content, String pagePath) async {
    //Parses the JSON passed in content to the tempMap
    Map<String, dynamic> tempMap = json.decode(content);
    if (pagePath.contains('data/characterSheet.html')) {
      final file = await _localFile;
      String charName = tempMap["Charname"];
      charName = removeSpecialCharacters(charName);
      // Write the file at character sheet directory
      if (charName.isNotEmpty) {
        final writeFile = new File(file.path + '/' + '$charName' + '.json');
        /*print(writeFile.writeAsString(content));*/
        return writeFile.writeAsString(content);
      } else {
        //if there is no character name filled in
        // saves to a default character sheet
        final writeFile = new File(file.path + '/savedCharacterSheet.json');
        /*print(writeFile.writeAsString(content));*/
        return writeFile.writeAsString(content);
      }
    } else {
      final file = await _localShipFile;
      String shipName = tempMap["Shipname"];
      shipName = removeSpecialCharacters(shipName);
      if (shipName.isNotEmpty) {
        final writeFile = new File(file.path + '/' + '$shipName' + '.json');
        /*print(writeFile.writeAsString(content));*/
        return writeFile.writeAsString(content);
      } else {
        //if there is no character name filled in
        // saves to a default ship sheet
        final writeFile = new File(file.path + '/savedShipSheet.json');
        /*print(writeFile.writeAsString(content));*/
        return writeFile.writeAsString(content);
      }
    }
  }

  //Replaces spaces with underscores, strips out all other special chars
  String removeSpecialCharacters(String nameString) {
    nameString = nameString.replaceAll(' ', '_');
    final cleanName = nameString?.replaceAll(
        RegExp(r"[-.!$%^&*()+|~=`{}#@\[\]:;'’<>?,/\\" '"”' "]"), "");
    return cleanName;
  }

  //Fetches directory where ship sheets are stored,
  // creates the directory if it doesn't exist

  Future<String> get _localShipPath async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory directory =
    await new Directory(appDocDirectory.path + '/' + 'ShipSheets')
        .create(recursive: true)
        .then((Directory directory) {
      print('Path of New Dir: ' + directory.path);
      return directory;
    });
    return directory.path;
  }

  //Makes a file at ship path directory
  Future<File> get _localShipFile async {
    final path = await _localShipPath;
    print('$path');
    return File('$path');
  }

  //Loads a specified HTML sheet from the asset manifest
  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}

class CharSheetFromDirectory extends StatelessWidget {
  CharSheetFromDirectory({Key key, this.filePath, this.pagePath})
      : super(key: key);
  String filePath;
  String pagePath;
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
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
            await loadHtmlFromAssets(pagePath, _controller);
          },
          onPageFinished: (String data) async {
            String savedFile = await localContent(filePath);
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
        writeContent(pageBody, pagePath);
      },
    );
  }

  Future<String> get _localPath async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory directory =
    await new Directory(appDocDirectory.path + '/' + 'CharacterSheets')
        .create(recursive: true)
        .then((Directory directory) {
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

  Future<File> writeContent(String content, String pagePath) async {
    //Parses the JSON passed in content to the tempMap
    Map<String, dynamic> tempMap = json.decode(content);
    if (pagePath.contains('data/characterSheet.html')) {
      final file = await _localFile;
      String charName = tempMap["Charname"];
      charName = removeSpecialCharacters(charName);
      // Write the file at character sheet directory
      if (charName.isNotEmpty) {
        final writeFile = new File(file.path + '/' + '$charName' + '.json');
        /*print(writeFile.writeAsString(content));*/
        return writeFile.writeAsString(content);
      } else {
        //if there is no character name filled in
        // saves to a default character sheet
        final writeFile = new File(file.path + '/savedCharacterSheet.json');
        /*print(writeFile.writeAsString(content));*/
        return writeFile.writeAsString(content);
      }
    } else {
      final file = await _localShipFile;
      String shipName = tempMap["Shipname"];
      shipName = removeSpecialCharacters(shipName);
      if (shipName.isNotEmpty) {
        final writeFile = new File(file.path + '/' + '$shipName' + '.json');
        /*print(writeFile.writeAsString(content));*/
        return writeFile.writeAsString(content);
      } else {
        //if there is no character name filled in
        // saves to a default ship sheet
        final writeFile = new File(file.path + '/savedShipSheet.json');
        /*print(writeFile.writeAsString(content));*/
        return writeFile.writeAsString(content);
      }
    }
  }

  //Replaces spaces with underscores, strips out all other special chars
  String removeSpecialCharacters(String nameString) {
    nameString = nameString.replaceAll(' ', '_');
    final cleanName = nameString?.replaceAll(
        RegExp(r"[-.!$%^&*()+|~=`{}#@\[\]:;'’<>?,/\\" '"”' "]"), "");
    return cleanName;
  }

  //Fetches directory where ship sheets are stored,
  // creates the directory if it doesn't exist

  Future<String> get _localShipPath async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory directory =
    await new Directory(appDocDirectory.path + '/' + 'ShipSheets')
        .create(recursive: true)
        .then((Directory directory) {
      print('Path of New Dir: ' + directory.path);
      return directory;
    });
    return directory.path;
  }

  //Makes a file at ship path directory
  Future<File> get _localShipFile async {
    final path = await _localShipPath;
    print('$path');
    return File('$path');
  }

  //Reads local file at specified path
  Future<String> localContent(String path) async {
    final file = new File(path);
    String localContent = await file.readAsString();
    return localContent;
  }
}

class FileListView extends StatefulWidget {
  final String directoryPath;

  const FileListView({Key key, this.directoryPath}) : super(key: key);

  @override
  _FileListViewState createState() => _FileListViewState();
}

class _FileListViewState extends State<FileListView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FutureBuilder(
          future: fileDirectory(widget.directoryPath),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? new CharacterSheetDirectory(directory: snapshot.data)
                : new Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<String> get _localPath async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory directory =
    await new Directory(appDocDirectory.path + '/' + 'CharacterSheets')
        .create(recursive: true)
        .then((Directory directory) {
      print('Path of New Dir: ' + directory.path);
      return directory;
    });
    return directory.path;
  }

  Future<String> get _localShipPath async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory directory =
    await new Directory(appDocDirectory.path + '/' + 'ShipSheets')
        .create(recursive: true)
        .then((Directory directory) {
      print('Path of New Dir: ' + directory.path);
      return directory;
    });
    return directory.path;
  }

  //Fetches the directory for the file list state view to read from
  Future<Directory> fileDirectory(String directoryPath) async {
    if (directoryPath.contains('data/characterSheet.html')) {
      String path = await _localPath;
      Directory directory = new Directory(path);
      return directory;
    } else if (directoryPath.contains('data/shipSheet.html')) {
      String path = await _localShipPath;
      Directory directory = new Directory(path);
      return directory;
    }
    String path = await _localPath;
    Directory directory = new Directory(path);
    return directory;
  }
}

class CharacterSheetDirectory extends StatefulWidget {
  final Directory directory;

  const CharacterSheetDirectory({Key key, this.directory}) : super(key: key);

  @override
  _CharacterSheetDirectoryState createState() =>
      _CharacterSheetDirectoryState();
}

// Reads everything in the passed directory and displays as a set of list tiles
class _CharacterSheetDirectoryState extends State<CharacterSheetDirectory> {
  @override
  Widget build(BuildContext context) {
    var fileList = widget.directory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".json"))
        .toList(growable: false);
    if(fileList.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Saved Character Sheets"),
        ),
        body: ListView.builder(
            itemCount: fileList == null ? 0 : fileList.length,
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
                      //When a tile is selected, makes a char sheet
                      // based on the tile's associated file
                      onTap: () =>
                      {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CharSheetFromDirectory(
                                filePath: file.path,
                                pagePath: widget.directory.path);
                          },
                        ))
                      },
                      //Trash icon that can delete files
                      trailing: IconButton(
                        icon: Icon(CupertinoIcons.trash),
                        onPressed: () {
                          showAlertDialog(context, file);
                        },
                      ),
                    )),
              );
            }),
      );
    }
    else{
      return Scaffold(
          appBar: AppBar(
              title: Text("No saved files found")
          ),
          body: Center(
            child: Text("It seems there are no files saved here, you can find the"
                "Character and Ship sheets under the Player Portal to get started"),
          )
      );
    }
  }

  showAlertDialog(BuildContext context, File file) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    //Deletes file and uses set state to refresh widget
    Widget deleteButton = FlatButton(
      child: Text("Delete"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        file.deleteSync(recursive: false);
        setState(() {});
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "If you wish to delete the associated sheet, press Delete. To dismiss this dialog, press Cancel"),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class LoadSheetPage extends StatefulWidget {
  final Directory directory;

  const LoadSheetPage({Key key, this.directory}) : super(key: key);

  @override
  _LoadSheetPageState createState() => _LoadSheetPageState();
}

class _LoadSheetPageState extends State<LoadSheetPage> {
  @override
  Widget build(BuildContext context) {
    var fileList = widget.directory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".json"))
        .toList(growable: false);
    if(fileList.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Saved Sheets"),
        ),
        body: ListView.builder(
            itemCount: fileList == null ? 0 : fileList.length,
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
                      //Pops context back with file path for sheet to interpret
                      onTap: () => {Navigator.pop(context, file.path)},
                      //Trash icon that can delete files
                      trailing: IconButton(
                        icon: Icon(CupertinoIcons.trash),
                        onPressed: () {
                          showAlertDialog(context, file);
                        },
                      ),
                    )),
              );
            }),
      );
    }
    else{
      return Scaffold(
          appBar: AppBar(
              title: Text("No saved files found")
          ),
          body: Center(
            child: Text("It seems there are no files saved here, you can find the"
                "Character and Ship sheets under the Player Portal to get started"),
          )
      );
    }
  }

  showAlertDialog(BuildContext context, File file) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      //If cancel is selected, pops the alert dialog from context
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget deleteButton = FlatButton(
      child: Text("Delete"),
      ////Deletes file and uses set state to refresh widget
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        file.deleteSync(recursive: false);
        setState(() {});
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "If you wish to delete the associated sheet, press Delete. To dismiss this dialog, press Cancel"),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class ChooseSheetDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(title: Text("Choose which directory to read sheets from")),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            SheetBox1(),
            SheetBox2(),
          ],
          shrinkWrap: true,
        ));
  }
}
