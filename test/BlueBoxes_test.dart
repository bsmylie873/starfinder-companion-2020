// Import the test package and Counter class

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testflutter/BlueBoxes.dart';

void main() {
  group('BlueBoxes', () {
  testWidgets('Blue Box text should read as specified value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(

    home: BlueBox()));
    final titleFinder = find.text('Character Generation');
    expect(titleFinder, findsOneWidget);

  });
  testWidgets('Blue Box1 text should read as specified value', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(

          home: BlueBox1()));
      final titleFinder = find.text('Character Races');
      expect(titleFinder, findsOneWidget);

  });
  testWidgets('Blue Box2 text should read as specified value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(

        home: BlueBox2()));
    final titleFinder = find.text('Skill Index');
    expect(titleFinder, findsOneWidget);

  });
  testWidgets('Blue Box3 text should read as specified value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(

        home: BlueBox3()));
    final titleFinder = find.text('Class Index');
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('Blue Box4 text should read as specified value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(

        home: BlueBox4()));
    final titleFinder = find.text('Magic Index');
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('Blue Box5 text should read as specified value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(

        home: BlueBox5()));
    final titleFinder = find.text('GM Rules');
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('Blue Box6 text should read as specified value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(

        home: BlueBox6()));
    final titleFinder = find.text('Character Sheet');
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('Blue Box7 text should read as specified value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(

        home: BlueBox7()));
    final titleFinder = find.text('Saved Char Sheets');
    expect(titleFinder, findsOneWidget);
  });


  });
}
