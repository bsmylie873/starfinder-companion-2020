import 'classScreen.dart';
import 'featScreen.dart';
import 'package:flutter/material.dart';
import 'raceScreen.dart';
import 'sheetScreen.dart';
import 'skillScreen.dart';

//These values dictate the number of buttons to be displayed and the height of
//each button.
const double pConstNumOfButtons = 6;
const double constContainerHeight = 1;

//Box 1.
class PlayerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //Uses card design.
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.hail),
            title: Text('Classes'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassList()),
              );
            }));
  }

}

//Box 2.
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

//Box 3.
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

//Box 4.
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
}

//Box 5
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

//Box 6
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
                    builder: (context) => PlayerSheetPage(path: 'data/shipsheet.html')),
              );
            }));
  }
}