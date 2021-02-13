import 'package:test/test.dart';
import '../lib/objects/race.dart';

void main() {
  String name1 = "name";
  String source1 = "source";
  String size1 = "size";
  String type1 = "type";
  String subtype1 = "subtype";
  int hp1 = 0;
  int speed1 = 0;
  String abilityModifiers1 = "ability modifiers";
  String averageHeight1 = "average height";
  String averageWeight1 = "average weight";
  String ageOfMaturity1 = "age of maturity";
  String maximumAge1 = "maximum age";
  int strMod1 = 0;
  int dexMod1 = 0;
  int conMod1 = 0;
  int intMod1 = 0;
  int wisMod1 = 0;
  int chaMod1 = 0;
  int reflexMod1 = 0;
  int fortMod1 = 0;
  int willMod1 = 0;
  int acrobaticsMod1 = 0;
  int athleticsMod1 = 0;
  int bluffMod1 = 0;
  int cultureMod1 = 0;
  int diplomacyMod1 = 0;
  int disguiseMod1 = 0;
  int engineeringMod1 = 0;
  int intimidateMod1 = 0;
  int lifeScienceMod1 = 0;
  int mysticismMod1 = 0;
  int medicineMod1 = 0;
  int perceptionMod1 = 0;
  int physicalScienceMod1 = 0;
  int senseMotiveMod1 = 0;
  int stealthMod1 = 0;
  int survivalMod1 = 0;
  int acMod1 = 0;
  int abilityPicks1 = 0;
  int skillPicks1 = 0;


  Race testRace2 = new Race(name: name1, source: source1, size: size1, type: type1,
  subtype: subtype1, hp: hp1, speed: speed1, abilityModifiers: abilityModifiers1,
  averageHeight: averageHeight1, averageWeight: averageWeight1, ageOfMaturity: ageOfMaturity1,
  maximumAge: maximumAge1, strMod: strMod1, dexMod: dexMod1, conMod: conMod1, intMod: intMod1,
  wisMod: wisMod1, chaMod: chaMod1, reflexMod: reflexMod1, fortMod: fortMod1, willMod: willMod1,
  acrobaticsMod: acrobaticsMod1, athleticsMod: athleticsMod1, bluffMod: bluffMod1,
  cultureMod: cultureMod1, diplomacyMod: diplomacyMod1, disguiseMod: disguiseMod1,
  engineeringMod: engineeringMod1, intimidateMod: intimidateMod1, lifeScienceMod: lifeScienceMod1,
  mysticismMod: mysticismMod1, medicineMod: medicineMod1, perceptionMod: perceptionMod1,
  physicalScienceMod: physicalScienceMod1, senseMotiveMod: senseMotiveMod1, stealthMod: stealthMod1,
  survivalMod: survivalMod1, acMod: acMod1, abilityPicks: abilityPicks1, skillPicks: skillPicks1);

  group('Assignment Test', () {
    test('Name should be "name"', () {
      expect(testRace2.name, "name");
    });

    test('Source should be "source"', () {
      expect(testRace2.source, "source");
    });

    test('Size should be "size"', () {
      expect(testRace2.size, size1);
    });

    test('Type should be "type"', () {
      expect(testRace2.type, type1);
    });

    test('Subtype should be "subtype"', () {
      expect(testRace2.subtype, subtype1);
    });

    test('HP should be "0"', () {
      expect(testRace2.hp, 0);
    });

    test('Speed should be "0"', () {
      expect(testRace2.speed, 0);
    });

    test('AbilityModifiers should be "ability modifiers"', () {
      expect(testRace2.abilityModifiers, "ability modifiers");
    });

    test('AverageHeight should be "average height"', () {
      expect(testRace2.averageHeight, "average height");
    });

    test('AverageWeight should be "average weight"', () {
      expect(testRace2.averageWeight, "average weight");
    });

    test('AgeOfMaturity should be "age of maturity"', () {
      expect(testRace2.ageOfMaturity, "age of maturity");
    });

    test('MaximumAge should be "maximum age"', () {
      expect(testRace2.maximumAge, "maximum age");
    });

    test('StrMod should be "0"', () {
      expect(testRace2.strMod, 0);
    });

    test('DexMod should be "0"', () {
      expect(testRace2.dexMod, 0);
    });

    test('ConMod should be "0"', () {
      expect(testRace2.conMod, 0);
    });

    test('IntMod should be "0"', () {
      expect(testRace2.intMod, 0);
    });

    test('WisMod should be "0"', () {
      expect(testRace2.wisMod, 0);
    });

    test('ChaMod should be "0"', () {
      expect(testRace2.chaMod, 0);
    });

    test('ReflexMod should be "0"', () {
      expect(testRace2.reflexMod, 0);
    });

    test('FortMod should be "0"', () {
      expect(testRace2.fortMod, 0);
    });

    test('WillMod should be "0"', () {
      expect(testRace2.willMod, 0);
    });

    test('AcrobaticsMod should be "0"', () {
      expect(testRace2.acrobaticsMod, 0);
    });

    test('AthleticsMod should be "0"', () {
      expect(testRace2.athleticsMod, 0);
    });

    test('BluffMod should be "0"', () {
      expect(testRace2.bluffMod, 0);
    });

    test('CultureMod should be "0"', () {
      expect(testRace2.cultureMod, 0);
    });

    test('DiplomacyMod should be "0"', () {
      expect(testRace2.diplomacyMod, 0);
    });

    test('DisguiseMod should be "0"', () {
      expect(testRace2.disguiseMod, 0);
    });

    test('EngineeringMod should be "0"', () {
      expect(testRace2.engineeringMod, 0);
    });

    test('IntimidateMod should be "0"', () {
      expect(testRace2.intimidateMod, 0);
    });

    test('LifeScienceMod should be "0"', () {
      expect(testRace2.lifeScienceMod, 0);
    });

    test('MysticismMod should be "0"', () {
      expect(testRace2.mysticismMod, 0);
    });

    test('MedicineMod should be "0"', () {
      expect(testRace2.medicineMod, 0);
    });

    test('PerceptionMod should be "0"', () {
      expect(testRace2.perceptionMod, 0);
    });

    test('PhysicalScienceMod should be "0"', () {
      expect(testRace2.physicalScienceMod, 0);
    });

    test('SenseMotiveMod should be "0"', () {
      expect(testRace2.senseMotiveMod, 0);
    });

    test('SurvivalMod should be "0"', () {
      expect(testRace2.survivalMod, 0);
    });

    test('AcMod should be "0"', () {
      expect(testRace2.acMod, 0);
    });

    test('AbilityPicks should be "0"', () {
      expect(testRace2.abilityPicks, 0);
    });

    test('SkillPicks should be "0"', () {
      expect(testRace2.skillPicks, 0);
    });

  });
}
