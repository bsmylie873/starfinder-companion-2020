import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';
import 'darktheme.dart';
import 'ThemeManager.dart';

ThemeData myThemeLight = lightTheme;
ThemeData myThemeDark = darkTheme;
const double constNumOfButtons = 6;
const double constContainerHeight = 1;

void main() {
  return runApp(ChangeNotifierProvider<ThemeManager>(
    create: (_) => new ThemeManager(),
    child: MyApp(),
  ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget bodySection = Container(
      child: SingleChildScrollView(child: Row(children: [ExpandedBlueBox()])),
    );

    return Consumer<ThemeManager>(
        builder: (context, theme, child) =>
            MaterialApp(
              theme: theme.getTheme(),
              home: Scaffold(
                  appBar: AppBar(
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.brightness_4_outlined),
                        onPressed: () => {
                          theme.toggleMode()
                        }
                      ),
                    ],
                    title: Text('Starfinder Companion'),
                  ),
                  body: ExpandedBlueBox()),
            )
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Container(
      width: width,
      height: buttonHeightWithToolbar(context),
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        border: Border.all(),
      ),
      child: FlatButton.icon(
        minWidth: width,
        height: buttonHeight(context),
        //
        //color: Colors.red,
        icon: Icon(Icons.audiotrack_rounded),
        //`Icon` to display
        label: Text('Button'),
        //`Text` to display
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
        },
      ),
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double buttonHeight(BuildContext context, {double numOfButtons = constNumOfButtons, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / numOfButtons;
  }

  double buttonHeightWithToolbar(BuildContext context, {double numOfButtons = constNumOfButtons}){
    return buttonHeight(context, numOfButtons: numOfButtons, sizeReduction: kToolbarHeight);
  }


}

class ExpandedBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var quarterWitdth  = width/8;
    for (var i = 0; i < 6; i++) {
      children.add(new BlueBox());
    }
    return new SingleChildScrollView(
      child: Container(
        width: width,
        height: containerHeightWithToolbar(context),
        padding: EdgeInsets.only(left: quarterWitdth, right: quarterWitdth),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: children,
        ),
      ),
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double containerHeight(BuildContext context, {double containerHeight = constContainerHeight, double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / containerHeight;
  }

  double containerHeightWithToolbar(BuildContext context, {double newContainerHeight = constContainerHeight}){
    return containerHeight(context, containerHeight: newContainerHeight, sizeReduction: kToolbarHeight);
  }

}

/*class IconState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: new IconButton(
          icon: Icon(Icons.brightness_7),
          onPressed: () => _notifier.value = ThemeNotifier(
        themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light),

    ),,
        )
    )
  }
}*/

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
