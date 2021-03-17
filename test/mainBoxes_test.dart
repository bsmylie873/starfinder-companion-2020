//CONTRIBUTION - BRANDON 0% CONOR 100%

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/screens/WidgetScreens.dart';
import 'package:testflutter/screens/playerBoxes.dart';
import '../lib/screens/mainBoxes.dart';

void main() {
  group('mainBoxes', () {
    testWidgets('Blue Box text should read as specified value', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(

          home: BlueBox()));
      final titleFinder = find.text('Player Portal');
      expect(titleFinder, findsOneWidget);

    });
    testWidgets('Blue Box text should have a list tile', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(

          home: BlueBox()));
      final listTileFinder = find.byType(ListTile);
      expect(listTileFinder, findsOneWidget);

    });
    // testWidgets('Blue Box should render player screen on tap', (WidgetTester tester) async {
    //   await tester.pumpWidget(MaterialApp(
    //
    //       home: BlueBox()));
    //   await tester.tap(find.byType(BlueBox));
    //   await tester.pump();
    //   final playerScreenFinder = find.byWidget(PlayerScreen());
    //   expect(playerScreenFinder, findsNWidgets(1));
    // });
    testWidgets('Blue Box1 text should read as specified value', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(

          home: BlueBox1()));
      final titleFinder = find.text('GM Portal');
      expect(titleFinder, findsOneWidget);

    });
    testWidgets('Blue Box2 text should read as specified value', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(

          home: BlueBox2()));
      final titleFinder = find.text('Sheet Portal');
      expect(titleFinder, findsOneWidget);

    });
    testWidgets('Blue Box3 text should read as specified value', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(

          home: BlueBox3()));
      final titleFinder = find.text('References');
      expect(titleFinder, findsOneWidget);

    });

  });
}