//CONTRIBUTION - BRANDON 0% CONOR 100%

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/screens/mainBoxes.dart';
import 'package:testflutter/screens/sheetScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() {
  group('PlayerSheetPage', () {
    testWidgets(
        'Player sheet page should initialise controller to specified '
        'value ', (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      await tester.pumpWidget(MaterialApp(home: PlayerSheetPage(path: path)));
     
      final webviewFinder = find.byType(WebView);
      expect(webviewFinder, findsOneWidget);
    });

    test(
        'Test that function loads correct'
        'value', () async {
      String path = 'data/characterSheet.html';
      String controllerData = await rootBundle.loadString(path);
      Future<String> expectedControllerData = rootBundle.loadString(path);
      expect(await expectedControllerData, controllerData);
    });
  });

  group('Remove special characters', () {
    test('Remove characters method removes dangerous characters', () {
      final playerSheetPage = PlayerSheetPage(path: 'data/characterSheet.html');
      String stringForRedaction = "//\\//\/\\/\\/\\/..String~~()##\\";
      stringForRedaction =
          playerSheetPage.removeSpecialCharacters(stringForRedaction);
      expect("String", stringForRedaction);
    });

    test('Remove characters method does not remove regular characters', () {
      final playerSheetPage = PlayerSheetPage(path: 'data/characterSheet.html');
      String stringForRedaction = "AEIOU AEIOU John Madden John Madden999";
      stringForRedaction =
          playerSheetPage.removeSpecialCharacters(stringForRedaction);
      expect("AEIOU_AEIOU_John_Madden_John_Madden999", stringForRedaction);
    });

    test('Remove characters method changes spaces to underscores', () {
      final playerSheetPage = PlayerSheetPage(path: 'data/characterSheet.html');
      String stringForRedaction = "Change the world my    "
          "final   message  goodbye";
      stringForRedaction =
          playerSheetPage.removeSpecialCharacters(stringForRedaction);
      expect("Change_the_world_my____final___message__goodbye",
          stringForRedaction);
    });
  });

  group('LocalContent method', () {
    test('Local content reads a flie and returns the file content', () async {
      String testString = "Testing that local content returns correct string";
      File file = new File('test/mockPath');
      file.writeAsString(testString);
      final playerSheetPage = PlayerSheetPage();
      Future<String> expectedString =
          playerSheetPage.localContent('test/mockPath');
      expect(await expectedString, testString);
    });
  });

  group('WriteContent method', () {
    test('write content writes a flie and returns an instance of a file',
        () async {
      File testFile = new File('test/testJSON.json');
      String testString = await testFile.readAsString();

      final playerSheetPage = PlayerSheetPage();
      File expectedFile = await playerSheetPage.writeContent(
          testString, 'data/characterSheet.html');
      String filePath = expectedFile.path;
      expect(expectedFile.path, filePath);
    });
  });

  group('CharacterSheetDirectory', () {
    testWidgets('Charsheet directory should have one scaffold',
        (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final scaffoldFinder = find.byType(Scaffold);
      expect(scaffoldFinder, findsOneWidget);
    });

    testWidgets('Charsheet directory should have one appbar',
        (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);
    });

    testWidgets(
        'Charsheet directory should have two text widgets'
        'One in the appbar and made by the main widget body',
        (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final textFinder = find.byType(Text);
      expect(textFinder, findsNWidgets(2));
    });
    testWidgets(
        'Charsheet directory should have two text widgets'
        'One in the appbar and made by the main widget body',
        (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final textFinder = find.byType(Text);
      expect(textFinder, findsNWidgets(2));
    });
    testWidgets(
        'Charsheet directory should have three text widgets'
        'One in the appbar and two in the main widget body',
        (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test/testData');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final textFinder = find.byType(Text);
      expect(textFinder, findsNWidgets(3));
    });
    testWidgets('Charsheet directory should have one ListView',
        (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test/testData');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final listViewFinder = find.byType(ListView);
      expect(listViewFinder, findsOneWidget);
    });
    testWidgets(
        'Charsheet directory should have one List Tile widget'
        'built by the main widget body', (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final tileFinder = find.byType(ListTile);
      expect(tileFinder, findsNWidgets(1));
    });
    testWidgets(
        'Charsheet directory should have two List Tile widgets'
        'built two in the main widget body', (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test/testData');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final tileFinder = find.byType(ListTile);
      expect(tileFinder, findsNWidgets(2));
    });

    testWidgets(
        'Charsheet directory should have one IconButton widget'
        'built by the main widget body', (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
     
      final iconFinder = find.byType(IconButton);
      expect(iconFinder, findsNWidgets(1));
    });
    testWidgets(
        'Charsheet directory should have two IconButton widgets'
        'built in the main widget body', (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test/testData');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
      final iconFinder = find.byType(IconButton);
      expect(iconFinder, findsNWidgets(2));
    });

    testWidgets('Charsheet testing tapping IconButton', (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(
          find.text("If you wish to delete the associated sheet, "
              "press Delete. To dismiss this dialog, press Cancel"),
          findsOneWidget);
    });
    testWidgets('Charsheet testing tapping IconButton displays AlertDialog', (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
          CharacterSheetDirectory(directory: directory, sheetPage: path)));
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(
          find.byType(AlertDialog),
          findsOneWidget);
    });
    testWidgets(
        'Charsheet directory should have two text widgets'
        'as the directory is empty', (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test/emptyTestDirectory');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
      final textFinder = find.byType(Text);
      expect(textFinder, findsNWidgets(2));
    });
    testWidgets(
        'Charsheet directory should have centre widget'
        'built in the main body as directory is empty',
        (WidgetTester tester) async {
      String path = 'data/characterSheet.html';
      Directory directory = new Directory('test/emptyTestDirectory');
      await tester.pumpWidget(MaterialApp(
          home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
      final centerFinder = find.byType(Center);
      expect(centerFinder, findsNWidgets(1));
    });
    testWidgets(
        'Charsheet directory should have scaffold widget'
            'built as the top level widget as directory is empty',
            (WidgetTester tester) async {
          String path = 'data/characterSheet.html';
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
          final scaffoldFinder = find.byType(Scaffold);
          expect(scaffoldFinder, findsNWidgets(1));
        });
    testWidgets(
        'Charsheet directory should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          String path = 'data/characterSheet.html';
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
          final appBarFinder = find.byType(AppBar);
          expect(appBarFinder, findsNWidgets(1));
        });
    testWidgets(
        'Charsheet directory should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          String path = 'data/characterSheet.html';
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
          final textFinder = find.text("It seems there are no files saved here, you can find the"
              "Character and Ship sheets under the Player Portal to get started");
          expect(textFinder, findsNWidgets(1));
        });
    testWidgets(
        'Charsheet directory should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          String path = 'data/characterSheet.html';
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
         
          final textFinder = find.text("No saved files found");
          expect(textFinder, findsNWidgets(1));
        });
    testWidgets(
        'Charsheet directory should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          String path = 'data/characterSheet.html';
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              CharacterSheetDirectory(directory: directory, sheetPage: path)));
         
          final centreFinder = find.byType(Center);
          expect(centreFinder, findsNWidgets(1));
        });

  });

  group('LoadSheetPage', () {
    testWidgets('LoadSheetPage should have one scaffold',
            (WidgetTester tester) async {
          Directory directory = new Directory('test');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));
         
          final scaffoldFinder = find.byType(Scaffold);
          expect(scaffoldFinder, findsOneWidget);
        });

    testWidgets('LoadSheetPage should have one appbar',
            (WidgetTester tester) async {
          Directory directory = new Directory('test');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));
         
          final appBarFinder = find.byType(AppBar);
          expect(appBarFinder, findsOneWidget);
        });

    testWidgets(
        'LoadSheetPage should have two text widgets'
            'One in the appbar and made by the main widget body',
            (WidgetTester tester) async {
          Directory directory = new Directory('test');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));
         
          final textFinder = find.byType(Text);
          expect(textFinder, findsNWidgets(2));
        });
    testWidgets(
        'LoadSheetPage should have two text widgets'
            'One in the appbar and made by the main widget body',
            (WidgetTester tester) async {
          Directory directory = new Directory('test');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));
         
          final textFinder = find.byType(Text);
          expect(textFinder, findsNWidgets(2));
        });
    testWidgets(
        'LoadSheetPage should have three text widgets'
            'One in the appbar and two in the main widget body',
            (WidgetTester tester) async {
          Directory directory = new Directory('test/testData');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));
         
          final textFinder = find.byType(Text);
          expect(textFinder, findsNWidgets(3));
        });
    testWidgets('LoadSheetPage directory should have one ListView',
            (WidgetTester tester) async {
          Directory directory = new Directory('test/testData');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));
         
          final listViewFinder = find.byType(ListView);
          expect(listViewFinder, findsOneWidget);
        });
    testWidgets(
        'LoadSheetPage should have one List Tile widget'
            'built by the main widget body', (WidgetTester tester) async {
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
          LoadSheetPage(directory: directory)));
     
      final tileFinder = find.byType(ListTile);
      expect(tileFinder, findsNWidgets(1));
    });
    testWidgets(
        'LoadSheetPage should have two List Tile widgets'
            'built two in the main widget body', (WidgetTester tester) async {
      Directory directory = new Directory('test/testData');
      await tester.pumpWidget(MaterialApp(
          home:
          LoadSheetPage(directory: directory)));
     
      final tileFinder = find.byType(ListTile);
      expect(tileFinder, findsNWidgets(2));
    });

    testWidgets(
        'LoadSheetPage should have one IconButton widget'
            'built by the main widget body', (WidgetTester tester) async {
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
          LoadSheetPage(directory: directory)));
     
      final iconFinder = find.byType(IconButton);
      expect(iconFinder, findsNWidgets(1));
    });
    testWidgets(
        'LoadSheetPage should have two IconButton widgets'
            'built in the main widget body', (WidgetTester tester) async {
      Directory directory = new Directory('test/testData');
      await tester.pumpWidget(MaterialApp(
          home:
          LoadSheetPage(directory: directory)));     
      final iconFinder = find.byType(IconButton);
      expect(iconFinder, findsNWidgets(2));
    });

    testWidgets('LoadSheetPage testing tapping IconButton', (WidgetTester tester) async {
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
          LoadSheetPage(directory: directory)));
     
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(
          find.text("If you wish to delete the associated sheet, "
              "press Delete. To dismiss this dialog, press Cancel"),
          findsOneWidget);
    });
    testWidgets('LoadSheetPage testing tapping IconButton displays AlertDialog', (WidgetTester tester) async {
      Directory directory = new Directory('test');
      await tester.pumpWidget(MaterialApp(
          home:
          LoadSheetPage(directory: directory)));
     
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(
          find.byType(AlertDialog),
          findsOneWidget);
    });

    testWidgets(
        'LoadSheetPage should have two text widgets'
            'as the directory is empty', (WidgetTester tester) async {
      Directory directory = new Directory('test/emptyTestDirectory');
      await tester.pumpWidget(MaterialApp(
          home:
          LoadSheetPage(directory: directory)));     
      final textFinder = find.byType(Text);
      expect(textFinder, findsNWidgets(2));
    });
    testWidgets(
        'LoadSheetPage directory should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));         
          final centerFinder = find.byType(Center);
          expect(centerFinder, findsNWidgets(1));
        });
    testWidgets(
        'LoadSheetPage should have scaffold widget'
            'built as the top level widget as directory is empty',
            (WidgetTester tester) async {
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));         
          final scaffoldFinder = find.byType(Scaffold);
          expect(scaffoldFinder, findsNWidgets(1));
        });
    testWidgets(
        'LoadSheetPage should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));         
          final appBarFinder = find.byType(AppBar);
          expect(appBarFinder, findsNWidgets(1));
        });

    testWidgets(
        'LoadSheetPage should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));            final textFinder = find.text("It seems there are no files saved here, you can find the"
              "Character and Ship sheets under the Player Portal to get started");
          expect(textFinder, findsNWidgets(1));
        });
    testWidgets(
        'LoadSheetPage should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));
          final textFinder = find.text("No saved files found");
          expect(textFinder, findsNWidgets(1));
        });
    testWidgets(
        'LoadSheetPage should have centre widget'
            'built in the main body as directory is empty',
            (WidgetTester tester) async {
          Directory directory = new Directory('test/emptyTestDirectory');
          await tester.pumpWidget(MaterialApp(
              home:
              LoadSheetPage(directory: directory)));
          final centreFinder = find.byType(Center);
          expect(centreFinder, findsNWidgets(1));
        });
  });
    group('FileListView', () {
      testWidgets('FileListView must have correct widgets', (WidgetTester tester) async{
        String directoryPath = 'test';
        await tester.pumpWidget(MaterialApp(
          home: FileListView(directoryPath: directoryPath)
        ));
        final centreFinder = find.byType(Center);
        expect(centreFinder, findsNWidgets(2));
      });
        testWidgets('FileListView must have correct widgets', (WidgetTester tester) async{
          String directoryPath = 'test';
          await tester.pumpWidget(MaterialApp(
              home: FileListView(directoryPath: directoryPath)
          ));
          await tester.pumpAndSettle();
          final centreFinder = find.byType(Center);
          expect(centreFinder, findsNWidgets(1));
        });
      testWidgets('FileListView must have correct widgets', (WidgetTester tester) async{
        String directoryPath = 'test';
        await tester.pumpWidget(MaterialApp(
            home: FileListView(directoryPath: directoryPath)
        ));
        await tester.pumpAndSettle();
        final charDirectoryFinder = find.byType(CharacterSheetDirectory);
        expect(charDirectoryFinder, findsOneWidget);
      });
    });
    group('ChooseSheetDirectory', () {
      testWidgets('Testing ChooseSheetDirectory', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
            home: ChooseSheetDirectory(),
        ));
        await tester.pumpAndSettle();
        final sheetBoxFinder = find.byType(SheetBox1);
        expect(sheetBoxFinder, findsOneWidget);
      });

      testWidgets('Testing ChooseSheetDirectory', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: ChooseSheetDirectory(),
        ));
        await tester.pumpAndSettle();
        final sheetBoxFinder = find.byType(SheetBox2);
        expect(sheetBoxFinder, findsOneWidget);
      });
      testWidgets('Testing ChooseSheetDirectory', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: ChooseSheetDirectory(),
        ));
        await tester.pumpAndSettle();
        final scaffoldFinder = find.byType(Scaffold);
        expect(scaffoldFinder, findsOneWidget);
      });
      testWidgets('Testing ChooseSheetDirectory', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: ChooseSheetDirectory(),
        ));
        await tester.pumpAndSettle();
        final appBarFinder = find.byType(AppBar);
        expect(appBarFinder, findsOneWidget);
      });
      testWidgets('Testing ChooseSheetDirectory', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: ChooseSheetDirectory(),
        ));
        await tester.pumpAndSettle();
        final gridViewFinder = find.byType(GridView);
        expect(gridViewFinder, findsOneWidget);
      });
    });

}
