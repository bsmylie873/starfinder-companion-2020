import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/ThemeNotifier.dart';
import 'theme.dart';
import 'darktheme.dart';
import 'ThemeNotifier.dart';

ThemeData myThemeLight = lightTheme;
ThemeData myThemeDark = darkTheme;

//This is a edit

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (BuildContext context) {
        return ThemeNotifier(
          ThemeMode.system,
        );
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _notifier =
      ValueNotifier<ThemeNotifier>(ThemeNotifier(ThemeMode.light));

  @override
  Widget build(BuildContext context) {
    Widget bodySection = Container(
      child: SingleChildScrollView(child: Row(children: [ExpandedBlueBox()])),
    );

    return ValueListenableBuilder<ThemeNotifier>(
      valueListenable: _notifier,
      builder: (_, model, __) {
        final themeMode = model.getThemeMode();
        return MaterialApp(
          theme: myThemeLight,
          // Provide light theme.
          darkTheme: myThemeDark,
          // Provide dark theme.
          themeMode: themeMode,
          // Decides which theme to show.
          home: Scaffold(
              appBar:
                  AppBar(title: Text('Starfinder Companion'), actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                  onPressed: () => _notifier.value = ThemeNotifier(
                      themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light),

                ),
              ]),
              body: ExpandedBlueBox()),
        );
      },
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
        color: Theme.of(context).buttonColor,
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

// /*
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:testflutter/ThemeNotifier.dart';
//
// //import 'package:named_routing/router.dart';
// import 'theme.dart';
// import 'darktheme.dart';
// import 'ThemeNotifier.dart';
//
// bool isSwitched = false;
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp(),);
// }
//
// //https://stackoverflow.com/questions/62231889/how-do-i-make-a-switch-to-dark-light-mode-button-in-flutter
//
// class MyApp extends StatelessWidget {
//   final _notifier = ValueNotifier<ThemeModel>(ThemeModel(ThemeMode.light));
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(valueListenable: _notifier, builder: (_, model, __) {
//       final mode = model.mode;
//     })
//
//     return MaterialApp(
//         title: 'Flutter Demo Home Page',
//         theme: lightTheme,
//         darkTheme: darkTheme,
//         home: MyHomePage(title: 'Flutter Demo Home Page'));
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget themeButtonSection = Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           // _buildButtonColumn(Colors.red, Icons.brightness_4_outlined, 'THEME'),
//          Switch(
//             value: Provider.of<ThemeDataProvider>(context).isDarkTheme,
//             onChanged: (boolVal) {
//               Provider.of<ThemeDataProvider>(context, listen: false).toggleTheme();
//             },
//           ),
//           Text(
//             'You have pushed the button this many times:',
//           ),
//           Text(
//             '$_counter',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//         ],
//       ),
//     );
//
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//             // Column is also a layout widget. It takes a list of children and
//             // arranges them vertically. By default, it sizes itself to fit its
//             // children horizontally, and tries to be as tall as its parent.
//             //
//             // Invoke "debug painting" (press "p" in the console, choose the
//             // "Toggle Debug Paint" action from the Flutter Inspector in Android
//             // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//             // to see the wireframe for each widget.
//             //
//             // Column has various properties to control how it sizes itself and
//             // how it positions its children. Here we use mainAxisAlignment to
//             // center the children vertically; the main axis here is the vertical
//             // axis because Columns are vertical (the cross axis would be
//             // horizontal).
//
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [themeButtonSection]),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class ThemeModel with ChangeNotifier {
//   final ThemeMode _mode;
//   ThemeMode get mode => _mode;
//
//   ThemeModel(this._mode);
// }*/
