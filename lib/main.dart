import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'screens/licenseScreen.dart';
import 'screens/mainBoxes.dart';
import 'screens/settingsScreen.dart';
import 'config/themeManager.dart';

//These constants determine how many buttons are displayed, and their height.
const double constNumOfButtons = 4;
const double constContainerHeight = 1;
bool permsGranted = false;

//Main thread, which runs the MyApp class and creates the notifier for the theme
//manager functionality.
void main() {
  return runApp(
    ChangeNotifierProvider<ThemeManager>(
      create: (_) => new ThemeManager(),
      child: MyApp(),
    ),
  );
}

//Initialise the main screen as a stateful widget.
class MyApp extends StatefulWidget{
  @override
  MyAppState createState() => MyAppState();

}

//The state of the main screen is handled here.
class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //Access to local storage is requested.
    requestPermissions();
    //Portrait mode is forced.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //Animated intro is played.
    return MaterialApp(
        title: 'Splash Screen',
        home: AnimatedSplashScreen(
            duration: 1000,
            splash: 'images/foreground.png',
            splashIconSize: 1500,
            nextScreen: MainScreen(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.black));
  }
}

//Method for accessing local storage.
void requestPermissions() async {
  var status = await Permission.storage.status;
  if (status.isUndetermined) {
    // Can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses[Permission.storage]); // it should print PermissionStatus.granted
  }

}

//Main screen is built.
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) =>
            MaterialApp(
              //Theme is loaded from the notifier here.
              theme: theme.getTheme(),
              //Structure of main screen is built.
              home: Scaffold(
                  appBar: AppBar(
                    leading: Builder(
                      builder: (BuildContext context) {
                        //Leading settings icon is built.
                        return IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsScreen()),
                            );
                          },
                          tooltip: MaterialLocalizations
                              .of(context)
                              .openAppDrawerTooltip,
                        );
                      },
                    ),
                    //Theme toggle button is built.
                    actions:
                    <Widget>[
                      IconButton(
                          icon: Icon(Icons.brightness_4_outlined),
                          onPressed: () => {theme.toggleMode()}),
                    ],
                    //Title is created.
                    title: Center(
                      child: Text('Starfinder Companion'),
                    ),
                  ),
                  //Body method ExpandedBlueBox is called, onto the centre of
                  //the body.
                  body: Center (
                    child: ExpandedBlueBox()
                  )
                  ),
            )
    );
  }
}

//This class calls the BlueBox classes and the displays the buttons in a grid.
class ExpandedBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Switch statement for better redundancy in creating the list of button
    //widgets.
    final children = <Widget>[];
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

    //Gridview creates a grid in the middle of the screen, displaying four
    //buttons with equal spacing.
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}