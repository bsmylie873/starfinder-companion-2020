import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart';
import 'theme.dart';
import 'darktheme.dart';
import 'thememanager.dart';
import 'wiki.dart';
import 'table.dart';
import 'screens/mainBoxes.dart';
import 'objects/spell.dart';
import 'package:permission_handler/permission_handler.dart';

ThemeData myThemeLight = lightTheme;
ThemeData myThemeDark = darkTheme;
const double constNumOfButtons = 4;
const double constContainerHeight = 1;

/*String gmpath = 'data/Game Mastering';
Directory gmdir = Directory(gmpath);
var gmList = gmdir.list(recursive: false).toList();*/

void main() {
  return runApp(
    ChangeNotifierProvider<ThemeManager>(
      create: (_) => new ThemeManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget{
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    requestPermissions();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: 'Splash Screen',
        home: AnimatedSplashScreen(
            duration: 1000,
            splash: 'images/StarLogo.png',
            splashIconSize: 1500,
            nextScreen: MainScreen(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.black));
  }
}

void requestPermissions() async {
  var status = await Permission.storage.status;
  if (status.isUndetermined) {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses[Permission.storage]); // it should print PermissionStatus.granted
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) =>
            MaterialApp(
              theme: theme.getTheme(),
              home: Scaffold(
                  appBar: AppBar(
                    leading: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsRoute()),
                            );
                          },
                          tooltip: MaterialLocalizations
                              .of(context)
                              .openAppDrawerTooltip,
                        );
                      },
                    ),
                    actions:
                    <Widget>[
                      IconButton(
                          icon: Icon(Icons.brightness_4_outlined),
                          onPressed: () => {theme.toggleMode()}),
                    ],
                    title: Center(
                      child: Text('Starfinder Companion'),
                    ),
                  ),
                  body: ExpandedBlueBox(
                  )),
            )
    );
  }
}


class ExpandedBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    var screenSize = MediaQuery
        .of(context)
        .size;
    var width = screenSize.width;
    var quarterWidth = width / 4;

    for (var i = 0; i < constNumOfButtons; i++) {
      switch(i) {
        case 0:
          children.add(new BlueBox());
          break;
        case 1:
          children.add(new BlueBox1());
          break;
        case 2:
          children.add(new BlueBox2());
          break;
        case 3:
          children.add(new BlueBox3());
          break;
      }
    }
    // return new SingleChildScrollView(
    //   child: Container(
    //     width: width,
    //     height: containerHeightWithToolbar(context),
    //     padding: EdgeInsets.only(left: quarterWidth, right: quarterWidth),
    //     child: GridView.count(
    //       primary: false,
    //       padding: const EdgeInsets.all(20),
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //       crossAxisCount: 2,
    //       children: children,
    //     ),
    //   ),
    // );
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
      shrinkWrap: true,
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size;
  }

  double containerHeight(BuildContext context,
      {double containerHeight = constContainerHeight,
        double sizeReduction = 0.0}) {
    return (screenSize(context).height - sizeReduction) / containerHeight;
  }

  double containerHeightWithToolbar(BuildContext context,
      {double newContainerHeight = constContainerHeight}) {
    return containerHeight(context,
        containerHeight: newContainerHeight, sizeReduction: kToolbarHeight);
  }
}


class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('To be implemented!'),
        ),
      ),
    );
  }
}