//CONTRIBUTION - BRANDON 50% CONOR 50%

import 'actionScreen.dart';
import 'bestiaryScreen.dart';
import 'deityScreen.dart';
import 'languageScreen.dart';
import 'package:flutter/material.dart';
import 'spellScreen.dart';
import 'vehicleScreen.dart';
import 'widgetScreens.dart';

//These values dictate the number of buttons to be displayed and the height of
//each button.
const double refConstNumOfButtons = 7;
const double refConstContainerHeight = 1;

//Box 1
class RefBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.hail),
            title: Text('Actions'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActionList()),
              );
            }));
  }
}

//Box 2
class RefBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.pets),
            title: Text('Bestiary'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BestiaryList()),
              );
            }));
  }
}

//Box 3
class RefBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.self_improvement),
            title: Text('Deities'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeitiesList()),
              );
            }));
  }
}

//Box 4
class RefBox3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.shield),
            title: Text('Equipment'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EquipScreen()),
              );
            }));
  }
}

//Box 5
class RefBox4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.speaker_notes),
            title: Text('Languages'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageList()),
              );
            }));
  }
}

//Box 6
class RefBox5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.auto_fix_high),
            title: Text('Spells'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpellList()),
              );
            }));
  }
}

//Box 7
class RefBox6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //Icon relevant to button destination.
        child: ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Vehicles'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VehicleList()),
              );
            }));
  }
}