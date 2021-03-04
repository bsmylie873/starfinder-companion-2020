import 'package:flutter/material.dart';
import 'package:testflutter/table.dart';
import 'WidgetScreens.dart';
import 'classScreen.dart';
import 'featScreen.dart';
import 'raceScreen.dart';
import 'skillScreen.dart';
import 'spellScreen.dart';
import 'sheetScreen.dart';
const double pConstNumOfButtons = 6;
const double constContainerHeight = 1;

class PlayerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.hail),
            title: Text('Classes'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassList()),
              );
            }));
  }

}

class PlayerBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.lightbulb_outline_sharp),
            title: Text('Feats'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeatList()),
              );
            }));
  }
}

class PlayerBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.accessibility_sharp),
            title: Text('Races'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RaceList()),
              );
            }));
  }
}

class PlayerBox3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.star),
            title: Text('Skills'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SkillList()),
              );
            }));
  }
  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = pConstNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = pConstNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}

class PlayerBox4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.contact_page_sharp),
            title: Text('Character Sheet'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlayerSheetPage(path: 'data/characterSheet.html')),
              );
            }));
  }
}

class PlayerBox5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.contact_page_sharp),
            title: Text('Ship Sheet'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlayerSheetPage(path: 'data/shipSheet.html')),
              );
            }));
  }


}