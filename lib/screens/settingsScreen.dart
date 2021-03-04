import 'licenseScreen.dart';
import 'openGameContentScreen.dart';
import 'openGameLicenseVersionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'productIdentityScreen.dart';

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

//Unimplemented settings screen which would hold settings.
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body:
      Column(
        children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width:  MediaQuery.of(context).size.width,
                    child: new RaisedButton(
                        child: new Text('License'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LicenseScreen()),
                          );
                        }
                    )
                ),

              ]
          ),
          Row(
              children: <Widget>[
                Container(
                    width:  MediaQuery.of(context).size.width,
                    child: new RaisedButton(
                        child: new Text('Open Gaming Content'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OpenGameContentScreen()),
                          );
                        }
                    )
                ),

              ]
          ),
          Row(
              children: <Widget>[
                Container(
                    width:  MediaQuery.of(context).size.width,
                    child: new RaisedButton(
                        child: new Text('Open Game License Version 1.0A'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OpenGameLicenseVersion()),
                          );
                        }
                    )
                ),
              ]
          ),
          Row(
              children: <Widget>[
                Container(
                    width:  MediaQuery.of(context).size.width,
                    child: new RaisedButton(
                        child: new Text('Product Identity'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductIdentityScreen()),
                          );
                        }
                    )
                ),
              ]
          ),
        ],
      ),
    );
  }
}

