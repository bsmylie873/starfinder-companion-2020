import 'dart:convert';
import 'equipBoxes.dart';
import 'package:flutter/material.dart';
import 'playerBoxes.dart';
import 'refBoxes.dart';

//Boxes for the player screen.
class ExpandedPlayerBox extends StatelessWidget {
  //Build method.
  @override
  Widget build(BuildContext context) {
    //Create list of widgets.
    final children = <Widget>[];

    //Populate list of widgets.
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
        case 5:
          children.add(new PlayerBox5());
          break;
      }
    }

    //Return a grid of buttons using list of widgets.
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
    );
  }

}

//PlayerScreen class.
class PlayerScreen extends StatelessWidget {
  //Create route name for navigation purposes.
  static const routeName = 'playerScreen';

  //Build method.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Player Options"),
        ),
        //Call method to display boxes in body.
        body: ExpandedPlayerBox());
  }
}

//Boxes for the references screen.
class ExpandedRefBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Create list of widgets.
    final children = <Widget>[];

    //Populate list of widgets.
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

    //Return a grid of buttons using list of widgets.
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

//RefScreen class.
class RefScreen extends StatelessWidget {
  //Create route name for navigation purposes.
  static const routeName = 'refScreen';

  //Build method.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("References"),
        ),
        //Call method to display boxes in body.
        body: ExpandedRefBox());
  }
}

//Boxes for the equipment screen.
class ExpandedEquipBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Create list of widgets.
    final children = <Widget>[];

    //Populate list of widgets.
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

    //Return a grid of buttons using list of widgets.
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

//EquipScreen class.
class EquipScreen extends StatelessWidget {
  //Create list of widgets.
  static const routeName = 'equipScreen';

  //Build method.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Equipment"),
        ),
        //Call method to display boxes in body.
        body: ExpandedEquipBox());
  }
}

//GMRules class.
class GMRules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GM Rules"),
        ),
        body: Container(
            child: Center(
              child: FutureBuilder(
                //Create a future to read local storage.
                  future: DefaultAssetBundle.of(context).loadString(
                      'AssetManifest.json'),
                  builder: (context, snapshot) {
                    //Create list of strings from snapshot.
                    List<String> files = getFileData(snapshot.data);
                    //Create
                    return files.isNotEmpty ? new DataPageBuilder(
                        fileData: files) : new Center(
                        child: CircularProgressIndicator());
                  }),
            )
        )
    );
  }

  List<String> getFileData(String data) {
    if (data == null) {
      return [];
    }
    List<String> parsedData = [];
    Map<String, dynamic> mapData = json.decode(data);
    parsedData = mapData.keys.where((String key) {
      return key.startsWith('data/GameMastering/');
    }).toList();
    for (int i = 0; i < parsedData.length; i++) {
      parsedData[i] = parsedData[i].replaceAll("%20", " ");
    }
    return parsedData;
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


