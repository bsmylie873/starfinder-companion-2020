import 'package:test/test.dart';
import '../lib/objects/spell.dart';

void main() {
  String name1 = "name";
  String castingTime1 = "casting time";
  String classes1 = "classes";
  String spellListDescription1 = "spell list description";
  String descriptor1 = "descriptor";
  String duration1 = "duration";
  String level1 = "level";
  String description1 = "description";
  String range1 = "range";
  String savingThrow1 = "saving throw";
  String school1 = "school";
  String source1 = "source";
  String pageNo1 = "page number";
  String spellResistance1 = "spell resistance";
  String targetsEffectArea1 = "targets effect area";

  Spell testSpell2 = new Spell(name: name1, castingTime: castingTime1, classes:
  classes1, spellListDescription: spellListDescription1, descriptor: descriptor1,
      duration: duration1, level: level1, description: description1, range: range1,
      savingThrow: savingThrow1, school: school1, source: source1, pageNo: pageNo1,
      spellResistance: spellResistance1, targetsEffectArea: targetsEffectArea1);

  group('Assignment Test', () {
    test('Name should be "name"', () {
      expect(testSpell2.name, "name");
    });

    test('CastingTime should be "castingTime"', () {
      expect(testSpell2.castingTime, "casting time");
    });

    test('Classes should be "classes"', () {
      expect(testSpell2.classes, "classes");
    });

    test('SpellListDescription should be "spell list description"', () {
      expect(testSpell2.spellListDescription, "spell list description");
    });

    test('Descriptor should be "descriptor"', () {
      expect(testSpell2.descriptor, "descriptor");
    });

    test('Duration should be "duration"', () {
      expect(testSpell2.duration, "duration");
    });

    test('Level should be "level"', () {
      expect(testSpell2.level, "level");
    });

    test('Description should be "level"', () {
      expect(testSpell2.description, "description");
    });

    test('Range should be "range"', () {
      expect(testSpell2.range, "range");
    });

    test('SavingThrow should be "saving throw"', () {
      expect(testSpell2.savingThrow, "saving throw");
    });

    test('School should be "school"', () {
      expect(testSpell2.school, "school");
    });

    test('Source should be "source"', () {
      expect(testSpell2.source, "source");
    });

    test('PageNumber should be "page number"', () {
      expect(testSpell2.pageNo, "page number");
    });

    test('SpellResistance should be "spell resistance"', () {
      expect(testSpell2.spellResistance, "spell resistance");
    });

    test('TargetsEffectArea should be "targets effect area"', () {
      expect(testSpell2.targetsEffectArea, "targets effect area");
    });

  });
}
