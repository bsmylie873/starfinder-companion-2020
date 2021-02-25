import 'package:flutter/material.dart';
import 'sheetScreen.dart';
import 'widgetScreens.dart';

const double constNumOfButtons = 4;
const double constContainerHeight = 1;

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.accessibility_sharp),
            title: Text('Player Portal'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayerScreen()),
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
            leading: Icon(Icons.menu_book_outlined),
            title: Text('GM Portal'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GMRules()),
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
            leading: Icon(Icons.star),
            title: Text('Sheet Portal'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
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

class BlueBox3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.audiotrack_rounded),
            title: Text('References'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RefScreen()),
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