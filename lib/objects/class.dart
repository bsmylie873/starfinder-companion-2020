import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class Class {
  String name;
  final String source;
  final int hp;
  final int stamina;
  final int levelPoints;
  final String armorProficiencies;
  final String weaponProficiencies;
  final String keyAbility;
  final bool acrobatics;
  final bool athletics;
  final bool bluff;
  final bool computers;
  final bool culture;
  final bool diplomacy;
  final bool disguise;
  final bool engineering;
  final bool intimidate;
  final bool lifeScience;
  final bool medicine;
  final bool mysticism;
  final bool perception;
  final bool piloting;
  final bool physicalScience;
  final bool professionCharisma;
  final bool professionIntelligence;
  final bool professionWisdom;
  final bool senseMotive;
  final bool sleightOfHand;
  final bool stealth;
  final bool survival;


  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("data/sfrpg_classes.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    print(jsonString);
    print(jsonResponse);
  }

  List<String> classDetails(Class classToParse) {
    List<String> classProperties = new List();
    //classProperties.add("Name: " + spellToParse.name);
    if (classToParse.source.isNotEmpty) {
      classProperties.add("Source: " + classToParse.source);
    }
    if (!classToParse.hp.isNaN) {
      classProperties.add("HP: " + classToParse.hp.toString());
    }
    if (!classToParse.stamina.isNaN) {
      classProperties.add("Stamina: " + classToParse.stamina.toString());
    }
    if (!classToParse.levelPoints.isNaN) {
      classProperties.add("Level Points: " + classToParse.levelPoints.toString());
    }
    if (classToParse.armorProficiencies.isNotEmpty) {
      classProperties.add("Armor Proficiencies: " + classToParse.armorProficiencies);
    }
    if (classToParse.weaponProficiencies.isNotEmpty) {
      classProperties.add("Weapon Proficiencies: " + classToParse.weaponProficiencies);
    }
    if (classToParse.keyAbility.isNotEmpty) {
      classProperties.add("Key Ability: " + classToParse.keyAbility);
    }
    classProperties.add("Proficiencies:");
    if (classToParse.acrobatics != null) {
      classProperties.add("Acrobatics: " + classToParse.acrobatics.toString());
    }
    if (classToParse.athletics != null) {
      classProperties.add("Athletics: " + classToParse.athletics.toString());
    }
    if (classToParse.bluff != null) {
      classProperties.add("Bluff: " + classToParse.bluff.toString());
    }
    if (classToParse.computers != null) {
      classProperties.add("Computers: " + classToParse.computers.toString());
    }
    if (classToParse.culture != null) {
      classProperties.add("Culture: " + classToParse.culture.toString());
    }
    if (classToParse.diplomacy != null) {
      classProperties.add("Diplomacy: " + classToParse.diplomacy.toString());
    }
    if (classToParse.disguise != null) {
      classProperties.add("Disguise: " + classToParse.disguise.toString());
    }
    if (classToParse.engineering != null) {
      classProperties.add("Engineering: " + classToParse.engineering.toString());
    }
    if (classToParse.intimidate != null) {
      classProperties.add("Intimidate: " + classToParse.intimidate.toString());
    }
    if (classToParse.lifeScience != null) {
      classProperties.add("Life Science: " + classToParse.lifeScience.toString());
    }
    if (classToParse.medicine != null) {
      classProperties.add("Medicine: " + classToParse.medicine.toString());
    }
    if (classToParse.mysticism != null) {
      classProperties.add("Mysticism: " + classToParse.mysticism.toString());
    }
    if (classToParse.perception != null) {
      classProperties.add("Perception: " + classToParse.perception.toString());
    }
    if (classToParse.piloting != null) {
      classProperties.add("Piloting: " + classToParse.piloting.toString());
    }
    if (classToParse.physicalScience != null) {
      classProperties.add("Physical Science: " + classToParse.physicalScience.toString());
    }
    if (classToParse.professionCharisma != null) {
      classProperties.add("Profession (Charisma): " + classToParse.professionCharisma.toString());
    }
    if (classToParse.professionIntelligence != null) {
      classProperties.add("Profession (Intelligence): " + classToParse.professionIntelligence.toString());
    }
    if (classToParse.professionWisdom != null) {
      classProperties.add("Profession (Wisdom): " + classToParse.professionWisdom.toString());
    }
    if (classToParse.senseMotive != null) {
      classProperties.add("Sense Motive: " + classToParse.senseMotive.toString());
    }
    if (classToParse.sleightOfHand != null) {
      classProperties.add("Sleight Of Hand: " + classToParse.sleightOfHand.toString());
    }
    if (classToParse.stealth != null) {
      classProperties.add("Stealth: " + classToParse.stealth.toString());
    }
    if (classToParse.survival != null) {
      classProperties.add("Survival: " + classToParse.survival.toString());
    }
    return classProperties;
  }


  Class({this.name, this.source, this.hp, this.stamina, this.levelPoints,
    this.armorProficiencies, this.weaponProficiencies, this.keyAbility, this.acrobatics,
    this.athletics, this.bluff, this.computers, this.culture, this.diplomacy, this.disguise,
    this.engineering, this.intimidate, this.lifeScience, this.medicine, this.mysticism,
    this.perception, this.piloting, this.physicalScience, this.professionCharisma,
    this.professionIntelligence, this.professionWisdom, this.senseMotive, this.sleightOfHand,
    this.stealth, this.survival,});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      name: json['Name'],
      source: json['Source'],
      hp: json['Hp'],
      stamina: json['Stamina'],
      levelPoints: json['LevelPoints'],
      armorProficiencies: json['ArmorProficiencies'],
      weaponProficiencies: json['WeaponProficiencies'],
      keyAbility: json['KeyAbility'],
      acrobatics: json['Acrobatics'],
      athletics: json['Athletics'],
      bluff: json['Bluff'],
      computers: json['Computers'],
      culture: json['Culture'],
      diplomacy: json['Diplomacy'],
      disguise: json['Disguise'],
      engineering: json['Engineering'],
      intimidate: json['Intimidate'],
      lifeScience: json['LifeScience'],
      medicine: json['Medicine'],
      mysticism: json['Mysticism'],
      perception: json['Perception'],
      piloting: json['Piloting'],
      physicalScience: json['PhysicalScience'],
      professionCharisma: json['ProfessionCharisma'],
      professionIntelligence: json['ProfessionIntelligence'],
      professionWisdom: json['ProfessionWisdom'],
      senseMotive: json['SenseMotive'],
      sleightOfHand: json['SleightOfHand'],
      stealth: json['Stealth'],
      survival: json['Survival'],
    );
  }

}