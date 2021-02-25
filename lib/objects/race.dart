import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class Race {
  String name;
  final String source;
  final String size;
  final String type;
  final String subtype;
  final int hp;
  final int speed;
  final String abilityModifiers;
  final String averageHeight;
  final String averageWeight;
  final String ageOfMaturity;
  final String maximumAge;
  final int strMod;
  final int dexMod;
  final int conMod;
  final int intMod;
  final int wisMod;
  final int chaMod;
  final int reflexMod;
  final int fortMod;
  final int willMod;
  final int acrobaticsMod;
  final int athleticsMod;
  final int bluffMod;
  final int cultureMod;
  final int diplomacyMod;
  final int disguiseMod;
  final int engineeringMod;
  final int intimidateMod;
  final int lifeScienceMod;
  final int mysticismMod;
  final int medicineMod;
  final int perceptionMod;
  final int physicalScienceMod;
  final int senseMotiveMod;
  final int stealthMod;
  final int survivalMod;
  final int acMod;
  final int abilityPicks;
  final int skillPicks;


  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("data/sfrpg_races.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    print(jsonString);
    print(jsonResponse);
  }

  List<String> raceDetails(Race raceToParse) {
    List<String> raceProperties = new List();
    //raceProperties.add("Name: " + spellToParse.name);
    if (raceToParse.source != null) {
      raceProperties.add("Source: " + raceToParse.source);
    }
    if (raceToParse.size != null) {
      raceProperties.add("Sizes: " + raceToParse.size);
    }
    if (raceToParse.type != null) {
      raceProperties.add("Type: " + raceToParse.type);
    }
    if (raceToParse.subtype != null) {
      raceProperties.add("Subtype: " + raceToParse.subtype);
    }
    if (raceToParse.hp != null) {
      raceProperties.add("HP: " + raceToParse.hp.toString());
    }
    if (raceToParse.speed != null) {
      raceProperties.add("Speed: " + raceToParse.speed.toString());
    }
    if (raceToParse.abilityModifiers != null) {
      raceProperties.add("Ability Modifiers: " + raceToParse.abilityModifiers);
    }
    if (raceToParse.averageHeight != null) {
      raceProperties.add("Average Height: " + raceToParse.averageHeight);
    }
    if (raceToParse.averageWeight != null) {
      raceProperties.add("Average Weight: " + raceToParse.averageWeight);
    }
    if (raceToParse.ageOfMaturity != null) {
      raceProperties.add("Age Of Maturity: " + raceToParse.ageOfMaturity);
    }
    if (raceToParse.maximumAge != null) {
      raceProperties.add("Maximum Age: " + raceToParse.maximumAge);
    }
    if (raceToParse.strMod != null) {
      raceProperties.add("Strength Modifier: " + raceToParse.strMod.toString());
    }
    if (raceToParse.dexMod != null) {
      raceProperties.add("Dexterity Modifier: " + raceToParse.dexMod.toString());
    }
    if (raceToParse.conMod != null) {
      raceProperties.add("Constitution Modifier: " + raceToParse.conMod.toString());
    }
    if (raceToParse.intMod != null) {
      raceProperties.add("Intelligence Modifier: " + raceToParse.intMod.toString());
    }
    if (raceToParse.wisMod != null) {
      raceProperties.add("Wisdom Modifier: " + raceToParse.wisMod.toString());
    }
    if (raceToParse.chaMod != null) {
      raceProperties.add("Charisma Modifier: " + raceToParse.chaMod.toString());
    }
    if (raceToParse.reflexMod != null) {
      raceProperties.add("Reflex Modifier: " + raceToParse.reflexMod.toString());
    }
    if (raceToParse.fortMod != null) {
      raceProperties.add("Fortitude Modifier: " + raceToParse.fortMod.toString());
    }
    if (raceToParse.willMod != null) {
      raceProperties.add("Willpower Modifier: " + raceToParse.willMod.toString());
    }
    if (raceToParse.acrobaticsMod != null) {
      raceProperties.add("Acrobatics Modifier: " + raceToParse.acrobaticsMod.toString());
    }
    if (raceToParse.athleticsMod != null) {
      raceProperties.add("Athletics Modifier: " + raceToParse.acrobaticsMod.toString());
    }
    if (raceToParse.bluffMod != null) {
      raceProperties.add("Bluff Modifier: " + raceToParse.bluffMod.toString());
    }
    if (raceToParse.cultureMod != null) {
      raceProperties.add("Culture Modifier: " + raceToParse.cultureMod.toString());
    }
    if (raceToParse.diplomacyMod != null) {
      raceProperties.add("Diplomacy Modifier: " + raceToParse.diplomacyMod.toString());
    }
    if (raceToParse.disguiseMod != null) {
      raceProperties.add("Disguise Modifier: " + raceToParse.disguiseMod.toString());
    }
    if (raceToParse.engineeringMod != null) {
      raceProperties.add("Engineering Modifier: " + raceToParse.engineeringMod.toString());
    }
    if (raceToParse.intimidateMod != null) {
      raceProperties.add("Intimidate Modifier: " + raceToParse.intimidateMod.toString());
    }
    if (raceToParse.lifeScienceMod != null) {
      raceProperties.add("Life Science Modifier: " + raceToParse.lifeScienceMod.toString());
    }
    if (raceToParse.mysticismMod != null) {
      raceProperties.add("Mysticism Modifier: " + raceToParse.mysticismMod.toString());
    }
    if (raceToParse.medicineMod != null) {
      raceProperties.add("Medicine Modifier: " + raceToParse.medicineMod.toString());
    }
    if (raceToParse.perceptionMod != null) {
      raceProperties.add("Perception Modifier: " + raceToParse.perceptionMod.toString());
    }
    if (raceToParse.physicalScienceMod != null) {
      raceProperties.add("Physical Science Modifier: " + raceToParse.physicalScienceMod.toString());
    }
    if (raceToParse.senseMotiveMod != null) {
      raceProperties.add("Sense Motive Modifier: " + raceToParse.senseMotiveMod.toString());
    }
    if (raceToParse.stealthMod != null) {
      raceProperties.add("Stealth Modifier: " + raceToParse.senseMotiveMod.toString());
    }
    if (raceToParse.survivalMod != null) {
      raceProperties.add("Survival Modifier: " + raceToParse.survivalMod.toString());
    }
    if (raceToParse.acMod != null) {
      raceProperties.add("AC Modifier: " + raceToParse.acMod.toString());
    }
    if (raceToParse.abilityPicks != null) {
      raceProperties.add("Ability Picks: " + raceToParse.abilityPicks.toString());
    }
    if (raceToParse.skillPicks != null) {
      raceProperties.add("Skill Picks: " + raceToParse.skillPicks.toString());
    }
    return raceProperties;
  }


  Race({this.name, this.source, this.size, this.type, this.subtype,
    this.hp, this.speed, this.abilityModifiers, this.averageHeight, this.averageWeight,
    this.ageOfMaturity, this.maximumAge, this.strMod, this.dexMod, this.conMod,
    this.intMod, this.wisMod, this.chaMod, this.reflexMod, this.fortMod, this.willMod,
    this.acrobaticsMod, this.athleticsMod, this.bluffMod, this.cultureMod, this.diplomacyMod,
    this.disguiseMod, this.engineeringMod, this.intimidateMod, this.lifeScienceMod,
    this.mysticismMod, this.medicineMod, this.perceptionMod, this.physicalScienceMod,
    this.senseMotiveMod, this.stealthMod, this.survivalMod, this.acMod, this.abilityPicks,
    this.skillPicks});

  factory Race.fromJson(Map<String, dynamic> json) {
    return Race(
      name: json['Name'],
      source: json['Source'],
      size: json['Size'],
      type: json['Type'],
      subtype: json['Subtype'],
      hp: json['Hp'],
      speed: json['Speed'],
      abilityModifiers: json['AbilityModifiers'],
      averageHeight: json['AverageHeight'],
      averageWeight: json['AverageWeight'],
      ageOfMaturity: json['AgeOfMaturity'],
      maximumAge: json['MaximumAge'],
      strMod: json['StrMod'],
      dexMod: json['DexMod'],
      conMod: json['ConMod'],
      intMod: json['IntMod'],
      wisMod: json['WisMod'],
      chaMod: json['ChaMod'],
      reflexMod: json['ReflexMod'],
      fortMod: json['FortMod'],
      willMod: json['WillMod'],
      acrobaticsMod: json['AcrobaticsMod'],
      athleticsMod: json['AthleticsMod'],
      bluffMod: json['BluffMod'],
      cultureMod: json['CultureMod'],
      diplomacyMod: json['DiplomacyMod'],
      disguiseMod: json['DisguiseMod'],
      engineeringMod: json['EngineeringMod'],
      intimidateMod: json['IntimidationMod'],
      lifeScienceMod: json['LifeScienceMod'],
      mysticismMod: json['MysticismMod'],
      medicineMod: json['MedicineMod'],
      perceptionMod: json['PerceptionMod'],
      physicalScienceMod: json['PhysicalScienceMod'],
      senseMotiveMod: json['SenseMotiveMod'],
      stealthMod: json['StealthMod'],
      survivalMod: json['SurvivalMod'],
      acMod: json['AcMod'],
      abilityPicks: json['AbilityPicks'],
      skillPicks: json['SkillPicks']
    );
  }

}