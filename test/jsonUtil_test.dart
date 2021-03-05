import '../lib/enums.dart';
import '../lib/jsonUtil.dart';
import '../lib/objects/class.dart';
import '../lib/objects/race.dart';
import '../lib/objects/spell.dart';
import '../lib/objects/weapon.dart';
import 'class_test.dart';
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  final TestWidgetsFlutterBinding binding =
  TestWidgetsFlutterBinding.ensureInitialized();
  Function eq = const ListEquality().equals;

  group('loadFromAJson expected behaviour test', () {
    String classFile =
        '{\n'
            +'   "Envoy": {\n'
            +'      "Source": "Core Rulebook",\n'
            +'      "Hp": 6,\n'
            +'      "Stamina": 6,\n'
            +'      "LevelPoints": 8,\n'
            +'      "ArmorProficiencies": "light armor",\n'
            +'      "WeaponProficiencies": "basic melee & grenades & small arms ",\n'
            +'      "KeyAbility": "CHA",\n'
            +'      "Acrobatics": true,\n'
            +'      "Athletics": true,\n'
            +'      "Bluff": true,\n'
            +'      "Computers": true,\n'
            +'      "Culture": true,\n'
            +'      "Diplomacy": true,\n'
            +'      "Disguise": true,\n'
            +'      "Engineering": true,\n'
            +'      "Intimidate": true,\n'
            +'      "LifeScience": false,\n'
            +'      "Medicine": true,\n'
            +'      "Mysticism": false,\n'
            +'      "Perception": true,\n'
            +'      "Piloting": true,\n'
            +'      "PhysicalScience": true,\n'
            +'      "ProfessionCharisma": true,\n'
            +'      "ProfessionIntelligence": true,\n'
            +'      "ProfessionWisdom": true,\n'
            +'      "SenseMotive": true,\n'
            +'      "SleightOfHand": true,\n'
            +'      "Stealth": true,\n'
            +'      "Survival": false\n'
            +'   },\n'
            +'   "Mechanic": {\n'
            +'      "Source": "Core Rulebook",\n'
            +'      "Hp": 6,\n'
            +'      "Stamina": 6,\n'
            +'      "LevelPoints": 4,\n'
            +'      "ArmorProficiencies": "light armor",\n'
            +'      "WeaponProficiencies": "basic melee & grenades & small arms ",\n'
            +'      "KeyAbility": "INT",\n'
            +'      "Acrobatics": false,\n'
            +'      "Athletics": true,\n'
            +'      "Bluff": false,\n'
            +'      "Computers": true,\n'
            +'      "Culture": false,\n'
            +'      "Diplomacy": false,\n'
            +'      "Disguise": false,\n'
            +'      "Engineering": true,\n'
            +'      "Intimidate": false,\n'
            +'      "LifeScience": false,\n'
            +'      "Medicine": false,\n'
            +'      "Mysticism": true,\n'
            +'      "Perception": true,\n'
            +'      "Piloting": true,\n'
            +'      "PhysicalScience": false,\n'
            +'      "ProfessionCharisma": true,\n'
            +'      "ProfessionIntelligence": true,\n'
            +'      "ProfessionWisdom": true,\n'
            +'      "SenseMotive": false,\n'
            +'      "SleightOfHand": false,\n'
            +'      "Stealth": false,\n'
            +'      "Survival": false\n'
            +'   },\n'
            +'   "Mystic": {\n'
            +'      "Source": "Core Rulebook",\n'
            +'      "Hp": 6,\n'
            +'      "Stamina": 6,\n'
            +'      "LevelPoints": 6,\n'
            +'      "ArmorProficiencies": "light armor",\n'
            +'      "WeaponProficiencies": "basic melee & grenades & small arms ",\n'
            +'      "KeyAbility": "WIS",\n'
            +'      "Acrobatics": false,\n'
            +'      "Athletics": false,\n'
            +'      "Bluff": true,\n'
            +'      "Computers": false,\n'
            +'      "Culture": true,\n'
            +'      "Diplomacy": true,\n'
            +'      "Disguise": true,\n'
            +'      "Engineering": false,\n'
            +'      "Intimidate": true,\n'
            +'      "LifeScience": true,\n'
            +'      "Medicine": true,\n'
            +'      "Mysticism": true,\n'
            +'      "Perception": true,\n'
            +'      "Piloting": false,\n'
            +'      "PhysicalScience": false,\n'
            +'      "ProfessionCharisma": true,\n'
            +'      "ProfessionIntelligence": true,\n'
            +'      "ProfessionWisdom": true,\n'
            +'      "SenseMotive": true,\n'
            +'      "SleightOfHand": false,\n'
            +'      "Stealth": false,\n'
            +'      "Survival": true\n'
            +'   },\n'
            +'   "Operative": {\n'
            +'      "Source": "Core Rulebook",\n'
            +'      "Hp": 6,\n'
            +'      "Stamina": 6,\n'
            +'      "LevelPoints": 8,\n'
            +'      "ArmorProficiencies": "light armor",\n'
            +'      "WeaponProficiencies": "basic melee & small arms & sniper weapons ",\n'
            +'      "KeyAbility": "DEX",\n'
            +'      "Acrobatics": true,\n'
            +'      "Athletics": true,\n'
            +'      "Bluff": true,\n'
            +'      "Computers": true,\n'
            +'      "Culture": true,\n'
            +'      "Diplomacy": false,\n'
            +'      "Disguise": true,\n'
            +'      "Engineering": true,\n'
            +'      "Intimidate": true,\n'
            +'      "LifeScience": false,\n'
            +'      "Medicine": true,\n'
            +'      "Mysticism": false,\n'
            +'      "Perception": true,\n'
            +'      "Piloting": true,\n'
            +'      "PhysicalScience": false,\n'
            +'      "ProfessionCharisma": true,\n'
            +'      "ProfessionIntelligence": true,\n'
            +'      "ProfessionWisdom": true,\n'
            +'      "SenseMotive": true,\n'
            +'      "SleightOfHand": true,\n'
            +'      "Stealth": true,\n'
            +'      "Survival": true\n'
            +'   },\n'
            +'   "Soldier": {\n'
            +'      "Source": "Core Rulebook",\n'
            +'      "Hp": 7,\n'
            +'      "Stamina": 7,\n'
            +'      "LevelPoints": 4,\n'
            +'      "ArmorProficiencies": "light armor & heavy armor ",\n'
            +'      "WeaponProficiencies": "basic melee & advanced melee & small arms & longarms & heavy weapons & sniper & grenades",\n'
            +'      "KeyAbility": "DEX | STR",\n'
            +'      "Acrobatics": true,\n'
            +'      "Athletics": true,\n'
            +'      "Bluff": false,\n'
            +'      "Computers": false,\n'
            +'      "Culture": false,\n'
            +'      "Diplomacy": false,\n'
            +'      "Disguise": false,\n'
            +'      "Engineering": true,\n'
            +'      "Intimidate": true,\n'
            +'      "LifeScience": false,\n'
            +'      "Medicine": true,\n'
            +'      "Mysticism": false,\n'
            +'      "Perception": false,\n'
            +'      "Piloting": true,\n'
            +'      "PhysicalScience": false,\n'
            +'      "ProfessionCharisma": true,\n'
            +'      "ProfessionIntelligence": true,\n'
            +'      "ProfessionWisdom": true,\n'
            +'      "SenseMotive": false,\n'
            +'      "SleightOfHand": false,\n'
            +'      "Stealth": false,\n'
            +'      "Survival": true\n'
            +'   },\n'
            +'   "Solarian": {\n'
            +'      "Source": "Core Rulebook",\n'
            +'      "Hp": 7,\n'
            +'      "Stamina": 7,\n'
            +'      "LevelPoints": 4,\n'
            +'      "ArmorProficiencies": "light armor",\n'
            +'      "WeaponProficiencies": "basic melee & advanced melee & small arms",\n'
            +'      "KeyAbility": "CHA",\n'
            +'      "Acrobatics": true,\n'
            +'      "Athletics": true,\n'
            +'      "Bluff": false,\n'
            +'      "Computers": false,\n'
            +'      "Culture": false,\n'
            +'      "Diplomacy": true,\n'
            +'      "Disguise": false,\n'
            +'      "Engineering": false,\n'
            +'      "Intimidate": true,\n'
            +'      "LifeScience": false,\n'
            +'      "Medicine": false,\n'
            +'      "Mysticism": true,\n'
            +'      "Perception": true,\n'
            +'      "Piloting": false,\n'
            +'      "PhysicalScience": true,\n'
            +'      "ProfessionCharisma": true,\n'
            +'      "ProfessionIntelligence": true,\n'
            +'      "ProfessionWisdom": true,\n'
            +'      "SenseMotive": true,\n'
            +'      "SleightOfHand": false,\n'
            +'      "Stealth": true,\n'
            +'      "Survival": false\n'
            +'   },\n'
            +'   "Technomancer": {\n'
            +'      "Source": "Core Rulebook",\n'
            +'      "Hp": 5,\n'
            +'      "Stamina": 5,\n'
            +'      "LevelPoints": 4,\n'
            +'      "ArmorProficiencies": "light armor",\n'
            +'      "WeaponProficiencies": "basic melee & small arms ",\n'
            +'      "KeyAbility": "INT",\n'
            +'      "Acrobatics": false,\n'
            +'      "Athletics": false,\n'
            +'      "Bluff": false,\n'
            +'      "Computers": true,\n'
            +'      "Culture": false,\n'
            +'      "Diplomacy": false,\n'
            +'      "Disguise": false,\n'
            +'      "Engineering": true,\n'
            +'      "Intimidate": false,\n'
            +'      "LifeScience": true,\n'
            +'      "Medicine": false,\n'
            +'      "Mysticism": true,\n'
            +'      "Perception": false,\n'
            +'      "Piloting": true,\n'
            +'      "PhysicalScience": false,\n'
            +'      "ProfessionCharisma": true,\n'
            +'      "ProfessionIntelligence": true,\n'
            +'      "ProfessionWisdom": true,\n'
            +'      "SenseMotive": false,\n'
            +'      "SleightOfHand": true,\n'
            +'      "Stealth": false,\n'
            +'      "Survival": false\n'
            +'   }\n'
            +'}'"";
    String path;
    test('JSON file sfrpg_classes should be returned', () async {
      path = "data/sfrpg_classes.json";
      Future<String> testString = loadFromAJson(path);
      expect(await testString, classFile);
    }
    );
  }
  );

  group('fetchAnEntry expected behaviour tests', () {
    String jsonLocation;
    indexType indexType1;
    String indexName;
    List<String> indexDetails = List();
    List<String> correctDetails = List();
    correctDetails.add("Source: Core Rulebook");
    correctDetails.add("HP: 6");
    correctDetails.add("Stamina: 6");
    correctDetails.add("Level Points: 8");
    correctDetails.add("Armor Proficiencies: light armor");
    correctDetails.add("Weapon Proficiencies: basic melee & grenades & small arms");
    correctDetails.add("Key Ability: CHA");
    correctDetails.add("Proficiencies:");
    correctDetails.add("Acrobatics: true");
    correctDetails.add("Athletics: true");
    correctDetails.add("Bluff: true");
    correctDetails.add("Computers: true");
    correctDetails.add("Culture: true");
    correctDetails.add("Diplomacy: true");
    correctDetails.add("Disguise: true");
    correctDetails.add("Engineering: true");
    correctDetails.add("Intimidate: true");
    correctDetails.add("Life Science: false");
    correctDetails.add("Medicine: true");
    correctDetails.add("Mysticism: false");
    correctDetails.add("Perception: true");
    correctDetails.add("Piloting: true");
    correctDetails.add("Physical Science: true");
    correctDetails.add("Profession (Charisma): true");
    correctDetails.add("Profession (Intelligence): true");
    correctDetails.add("Profession (Wisdom): true");
    correctDetails.add("Sense Motive: true");
    correctDetails.add("Sleight Of Hand: true");
    correctDetails.add("Stealth: true");
    correctDetails.add("Survival: false");

    test('Details for Envoy should be returned', () async {
      jsonLocation = "data/sfrpg_classes.json";
      indexType1 = indexType.CLASS;
      indexName = "Envoy";
      Future<List<String>> returnList;
      returnList = fetchAnEntry(jsonLocation, indexType1, indexName, indexDetails);
      expect (await returnList, correctDetails);
    });
  });
}
