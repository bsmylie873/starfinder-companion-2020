import '../screens/weaponScreen.dart';
import 'armorScreen.dart';
import 'augmentationScreen.dart';
import 'computerScreen.dart';
import 'hybridScreen.dart';
import 'magicScreen.dart';
import 'otherScreen.dart';
import 'package:flutter/material.dart';
import 'techScreen.dart';
import 'weaponScreen.dart';

//These values dictate the number of buttons to be displayed and the height of
//each button.
const double equipConstNumOfButtons = 8;
const double equipConstContainerHeight = 1;

//Box 1.
class EquipBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.shield),
            title: Text('Armor'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArmorList()),
              );
            }));
  }
}

//Box 2.
class EquipBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.android),
            title: Text('Augments'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AugmentationList()),
              );
            }));
  }
}

//Box 3.
class EquipBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.computer),
            title: Text('Computers'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ComputerList()),
              );
            }));
  }
}

//Box 4.
class EquipBox3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.category),
            title: Text('Hybrid Items'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HybridList()),
              );
            }));
  }
}

//Box 5.
class EquipBox4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
          //Icon relevant to button destination.
            leading: Icon(Icons.auto_fix_high),
            title: Text('Magic Items'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MagicList()),
              );
            }));
  }
}

//Box 6.
class EquipBox5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
      //Icon relevant to button destination.
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
            leading: Icon(Icons.backpack),
            title: Text('Other Purchases'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OtherList()),
              );
            }));
  }
}

//Box 7.
class EquipBox6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
      //Icon relevant to button destination.
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
            leading: Icon(Icons.biotech),
            title: Text('Tech Items'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TechList()),
              );
            }));
  }
}

//Box 8.
class EquipBox7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Uses card design.
    return Card(
      //Icon relevant to button destination.
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: ListTile(
            leading: Icon(Icons.colorize),
            title: Text('Weapons'),
            //When tapped, tile will load the new screen index.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeaponList()),
              );
            }));
  }
}
