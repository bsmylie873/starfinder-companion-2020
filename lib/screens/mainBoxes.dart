import 'package:flutter/material.dart';
import 'sheetScreen.dart';
import 'widgetScreens.dart';

//These values dictate the number of buttons to be displayed and the height of
//each button.
const double constNumOfButtons = 4;
const double constContainerHeight = 1;

//Box 1
class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //Uses card design.
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.accessibility_sharp),
            title: Text('Player Portal'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayerScreen()),
              );
            }));
  }

}

//Box 2
class BlueBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //Uses card design.
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.menu_book_outlined),
            title: Text('GM Portal'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GMRules()),
              );
            }));
  }
}

//Box 3
class BlueBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //Uses card design.
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.star),
            title: Text('Sheet Portal'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FileListView()),
              );
            }
            )
    );
  }
}

//Box 4
class BlueBox3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //Uses card design.
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('References'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RefScreen()),
              );
            }));
  }
}