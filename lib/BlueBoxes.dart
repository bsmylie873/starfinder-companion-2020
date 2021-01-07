import 'package:flutter/material.dart';
import 'package:testflutter/table.dart';
import 'WidgetScreens.dart';
import 'classScreen.dart';
import 'raceScreen.dart';
import 'spellScreen.dart';
const double constNumOfButtons = 7;
const double constContainerHeight = 1;

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Character Generation'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CharacterGeneration()),
              );
            }));
  }

}

class BlueBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Character Races'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RaceIndex()),
              );
            }));
  }
}

class BlueBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Skill Index'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SkillIndex()),
              );
            }));
  }

}

class BlueBox3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Class Index'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassIndex()),
              );
            }));
  }
}

class BlueBox4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Magic Index'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpellList()),
              );
            }));
  }
}

class BlueBox5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('GM Rules'),
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

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Character Sheet'),
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

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('Table Example'),
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