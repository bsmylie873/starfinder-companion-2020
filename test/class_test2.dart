import 'package:test/test.dart';
import '../lib/objects/class.dart';

void main() {
  String name1 = "name";
  String source1 = "source";
  int hp1 = 0;
  int stamina1 = 0;
  int levelPoints1 = 0;
  String armorProficiencies1 = "armor proficiencies";
  String weaponProficiencies1 = "weapon proficiencies";
  String keyAbility1 = "key ability";
  bool acrobatics1 = false;
  bool athletics1 = false;
  bool bluff1 = false;
  bool computers1 = false;
  bool culture1 = false;
  bool diplomacy1 = false;
  bool disguise1 = false;
  bool engineering1 = false;
  bool intimidate1 = false;
  bool lifeScience1 = false;
  bool medicine1 = false;
  bool mysticism1 = false;
  bool perception1 = false;
  bool piloting1 = false;
  bool physicalScience1 = false;
  bool professionCharisma1 = false;
  bool professionIntelligence1 = false;
  bool professionWisdom1 = false;
  bool senseMotive1 = false;
  bool sleightOfHand1 = false;
  bool stealth1 = true;
  bool survival1 = false;

  Class testClass2 = new Class(name: name1, source: source1, hp: hp1, stamina:
      stamina1, levelPoints: levelPoints1, armorProficiencies: armorProficiencies1,
    weaponProficiencies: weaponProficiencies1, keyAbility: keyAbility1, acrobatics: acrobatics1,
    athletics: athletics1, bluff: bluff1, computers: computers1, culture: culture1,
    diplomacy: diplomacy1, disguise: disguise1, engineering: engineering1, intimidate: intimidate1,
    lifeScience: lifeScience1, medicine: medicine1, mysticism: mysticism1, perception: perception1,
    piloting: piloting1, physicalScience: physicalScience1, professionCharisma: professionCharisma1,
    professionIntelligence: professionIntelligence1, professionWisdom: professionWisdom1,
    senseMotive: senseMotive1, sleightOfHand: sleightOfHand1, stealth: stealth1,
    survival: survival1);

  group('Assignment Test', () {
    test('Name should be "name"', () {
      expect(testClass2.name, "name");
    });

    test('Source should be "source"', () {
      expect(testClass2.source, "source");
    });

    test('HP should be "0"', () {
      expect(testClass2.hp, 0);
    });

    test('Stamina should be "0"', () {
      expect(testClass2.stamina, 0);
    });

    test('LevelPoints should be "0"', () {
      expect(testClass2.levelPoints, 0);
    });

    test('ArmorProficiencies should be "armor proficiencies"', () {
      expect(testClass2.armorProficiencies, "armor proficiencies");
    });

    test('WeaponProficiencies should be "weapon proficiencies"', () {
      expect(testClass2.weaponProficiencies, "weapon proficiencies");
    });

    test('KeyAbility should be "key ability"', () {
      expect(testClass2.keyAbility, "key ability");
    });

    test('Acrobatics should be "false"', () {
      expect(testClass2.acrobatics, false);
    });

    test('Athletics should be "false"', () {
      expect(testClass2.athletics, false);
    });

    test('Bluff should be "false"', () {
      expect(testClass2.bluff, false);
    });

    test('Computers should be "false"', () {
      expect(testClass2.computers, false);
    });

    test('Culture should be "false"', () {
      expect(testClass2.culture, false);
    });

    test('Diplomacy should be "false"', () {
      expect(testClass2.diplomacy, false);
    });

    test('Disguise should be "false"', () {
      expect(testClass2.disguise, false);
    });

    test('Engineering should be "false"', () {
      expect(testClass2.engineering, false);
    });

    test('Intimidate should be "false"', () {
      expect(testClass2.intimidate, false);
    });

    test('LifeScience should be "false"', () {
      expect(testClass2.lifeScience, false);
    });

    test('Medicine should be "false"', () {
      expect(testClass2.medicine, false);
    });

    test('Mysticism should be "false"', () {
      expect(testClass2.mysticism, false);
    });

    test('Perception should be "false"', () {
      expect(testClass2.perception, false);
    });

    test('Piloting should be "false"', () {
      expect(testClass2.piloting, false);
    });

    test('PhysicalScience should be "false"', () {
      expect(testClass2.physicalScience, false);
    });

    test('ProfessionCharisma should be "false"', () {
      expect(testClass2.professionCharisma, false);
    });

    test('ProfessionIntelligence should be "false"', () {
      expect(testClass2.professionIntelligence, false);
    });

    test('ProfessionWisdom should be "false"', () {
      expect(testClass2.professionWisdom, false);
    });

    test('SenseMotive should be "false"', () {
      expect(testClass2.senseMotive, false);
    });

    test('SleightOfHand should be "false"', () {
      expect(testClass2.sleightOfHand, false);
    });

    test('Stealth should be "false"', () {
      expect(testClass2.stealth, true);
    });

    test('Survival should be "false"', () {
      expect(testClass2.survival, false);
    });

  });
}
