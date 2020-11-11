import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';
import 'darktheme.dart';
import 'ThemeManager.dart';

ThemeData myThemeLight = lightTheme;
ThemeData myThemeDark = darkTheme;
//This is a edit

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
    return Container(
      width: 125,
      height: 75,
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .buttonColor,
        border: Border.all(),
      ),
      child: FlatButton.icon(
        minWidth: 100,
        height: 75,
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
}

class ExpandedBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < 10; i++) {
      children.add(new BlueBox());
    }
    return new SingleChildScrollView(
      child: Container(
        //width: 125,
        height: 75,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: children,
        ),
      ),
    );
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
