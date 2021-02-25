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

const double equipConstNumOfButtons = 8;
const double equipConstContainerHeight = 1;

class EquipBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.shield),
            title: Text('Armor'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArmorList()),
              );
            }));
  }
}

class EquipBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.android),
            title: Text('Augments'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AugmentationList()),
              );
            }));
  }
}

class EquipBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.computer),
            title: Text('Computers'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ComputerList()),
              );
            }));
  }
}
class EquipBox3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.category),
            title: Text('Hybrid Items'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HybridList()),
              );
            }));
  }
}

class EquipBox4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.auto_fix_high),
            title: Text('Magic Items'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MagicList()),
              );
            }));
  }
}

class EquipBox5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.backpack),
            title: Text('Other Purchases'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OtherList()),
              );
            }));
  }
}

class EquipBox6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.biotech),
            title: Text('Tech Items'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TechList()),
              );
            }));
  }
}

/*class EquipBox7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Vehicles'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VehicleList()),
              );
            }));
  }
}*/

class EquipBox7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
        //color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.colorize),
            title: Text('Weapons'),
            //contentPadding: EdgeInsets.only(bottom: 50.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeaponList()),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context,
      {double numOfButtons = equipConstNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context,
      {double numOfButtons = equipConstNumOfButtons}) {
    return buttonHeight(context,
        numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }
}