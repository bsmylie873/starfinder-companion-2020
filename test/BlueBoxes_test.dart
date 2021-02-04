// Import the test package and Counter class

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testflutter/BlueBoxes.dart';

void main() {
  group('BlueBoxes', () {
  testWidgets('Blue Box text should read as specified value', (WidgetTester tester) async {
    await tester.pumpWidget(BlueBox());
    //final titleFinder = find.text('Character Generation');
    //expect(titleFinder, findsOneWidget);

    
  });
  test('Blue Box1 text should read as specified value', () {

  });
  test('Blue Box2 text should read as specified value', () {

  });
  test('Blue Box3 text should read as specified value', () {

  });
  });
}
