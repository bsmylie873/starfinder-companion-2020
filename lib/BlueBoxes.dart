import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'theme.dart';
import 'darktheme.dart';
import 'thememanager.dart';
import 'wiki.dart';
import 'dart:convert';
import 'table.dart';
import 'WidgetScreens.dart';

const double constNumOfButtons = 6;
const double constContainerHeight = 1;

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Test List Tile'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CharacterGeneration()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = constNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}

class BlueBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Test List Tile'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RaceIndex()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = constNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}

class BlueBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Test List Tile'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SkillIndex()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = constNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}

class BlueBox3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Test List Tile'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassIndex()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = constNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}

class BlueBox4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Test List Tile'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MagicIndex()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = constNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}

class BlueBox5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Test List Tile'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GMRules()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = constNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}

class BlueBox6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Test List Tile'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CharacterSheetAttempt()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = constNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}

class BlueBox7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Test List Tile'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TableLayout()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = constNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}
