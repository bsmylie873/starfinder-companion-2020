import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'theme.dart';
import 'darktheme.dart';
import 'thememanager.dart';
import 'wiki.dart';
import 'table.dart';

ThemeData myThemeLight = lightTheme;
ThemeData myThemeDark = darkTheme;
const double constNumOfButtons = 6;
const double constContainerHeight = 1;

void main() {
  return runApp(
    ChangeNotifierProvider<ThemeManager>(
      create: (_) => new ThemeManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) => MaterialApp(
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
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        );
                      },
                    ),
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.brightness_4_outlined),
                          onPressed: () => {theme.toggleMode()}),
                    ],
                    title: Center(
                      child: Text('Starfinder Companion'),
                    ),
                  ),
                  body: ExpandedBlueBox()),
            ));
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
            MaterialPageRoute(builder: (context) => TableLayout()),
          );
        },
      ),
    );
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

class ExpandedBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var quarterWidth = width / 4;

    for (var i = 0; i < 6; i++) {
      children.add(new BlueBox());
    }
    return new SingleChildScrollView(
      child: Container(
        width: width,
        height: containerHeightWithToolbar(context),
        padding: EdgeInsets.only(left: quarterWidth, right: quarterWidth),
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
    return MaterialApp(
      title: 'Flutter Web Views',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Arial",
          textTheme: TextTheme(
              button: TextStyle(color: Colors.white, fontSize: 18.0),
              title: TextStyle(color: Colors.red))),
      home: Home(),
    );
  }
}

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Screen"),
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

const htmlData = """
<h1>Header 1</h1>
<h2>Header 2</h2>
<h3>Header 3</h3>
<h4>Header 4</h4>
<h5>Header 5</h5>
<h6>Header 6</h6>
<h3>Ruby Support:</h3>
      <p>
        <ruby>
          漢<rt>かん</rt>
          字<rt>じ</rt>
        </ruby>
        &nbsp;is Japanese Kanji.
      </p>
      <h3>Support for <code>sub</code>/<code>sup</code></h3>
      Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
      <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
      <h3>Table support (with custom styling!):</h3>
      <p>
      <q>Famous quote...</q>
      </p>
      <table>
      <colgroup>
        <col width="50%" />
        <col width="25%" />
        <col width="25%" />
      </colgroup>
      <thead>
      <tr><th>One</th><th>Two</th><th>Three</th></tr>
      </thead>
      <tbody>
      <tr>
        <td>Data</td><td>Data</td><td>Data</td>
      </tr>
      <tr>
        <td>Data</td><td>Data</td><td>Data</td>
      </tr>
      </tbody>
      <tfoot>
      <tr><td>fData</td><td>fData</td><td>fData</td></tr>
      </tfoot>
      </table>
      <h3>Custom Element Support:</h3>
      <flutter></flutter>
      <flutter horizontal></flutter>
      <h3>SVG support:</h3>
      <svg id='svg1' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
            <circle r="32" cx="35" cy="65" fill="#F00" opacity="0.5"/>
            <circle r="32" cx="65" cy="65" fill="#0F0" opacity="0.5"/>
            <circle r="32" cx="50" cy="35" fill="#00F" opacity="0.5"/>
      </svg>
      <h3>List support:</h3>
      <ol>
            <li>This</li>
            <li><p>is</p></li>
            <li>an</li>
            <li>
            ordered
            <ul>
            <li>With<br /><br />...</li>
            <li>a</li>
            <li>nested</li>
            <li>unordered
            <ol>
            <li>With a nested</li>
            <li>ordered list.</li>
            </ol>
            </li>
            <li>list</li>
            </ul>
            </li>
            <li>list! Lorem ipsum dolor sit amet.</li>
            <li><h2>Header 2</h2></li>
            <h2><li>Header 2</li></h2>
      </ol>
      <h3>Link support:</h3>
      <p>
        Linking to <a href='https://github.com'>websites</a> has never been easier.
      </p>
      <h3>Image support:</h3>
      <p>
        <img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' />
        <a href='https://google.com'><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></a>
        <img alt='Alt Text of an intentionally broken image' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30d' />
      </p>
      <!--
      <h3>Video support:</h3>
      <video controls>
        <source src="https://www.w3schools.com/html/mov_bbb.mp4" />
      </video>
      <h3>Audio support:</h3>
      <audio controls>
        <source src="https://www.w3schools.com/html/horse.mp3" />
      </audio>
      <h3>IFrame support:</h3>
      <iframe src="https://google.com"></iframe>
      -->
""";
