import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class Spell {
  String name;
  final String castingTime;
  final String classes;
  final String spellListDescription;
  final String descriptor;
  final String duration;
  final String level;
  final String description;
  final String range;
  final String savingThrow;
  final String school;
  final String source;
  final String pageNo;
  final String spellResistance;
  final String targetsEffectArea;

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("data/sfrpg_spells.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    print(jsonString);
    print(jsonResponse);
  }

  List<String> spellDetails(Spell spellToParse) {
    List<String> spellProperties = new List();
    //spellProperties.add("Name: " + spellToParse.name);
    if (spellToParse.castingTime != null) {
      spellProperties.add("Casting Time: " + spellToParse.castingTime);
    }
    if (spellToParse.classes != null) {
      spellProperties.add("Classes: " + spellToParse.classes);
    }
    if (spellToParse.spellListDescription != null) {
      spellProperties.add("Spell List Description: " + spellToParse.spellListDescription);
    }
    if (spellToParse.descriptor != null) {
      spellProperties.add("Descriptor: " + spellToParse.descriptor);
    }
    if (spellToParse.duration != null) {
      spellProperties.add("Duration: " + spellToParse.duration);
    }
    if (spellToParse.level != null) {
      spellProperties.add("Level: " + spellToParse.level);
    }
    if (spellToParse.description != null) {
      spellProperties.add("Description: " + spellToParse.description);
    }
    if (spellToParse.range != null) {
      spellProperties.add("Range: " + spellToParse.range);
    }
    if (spellToParse.savingThrow != null) {
      spellProperties.add("Saving Throw: " + spellToParse.savingThrow);
    }
    if (spellToParse.school != null) {
      spellProperties.add("School: " + spellToParse.school);
    }
    if (spellToParse.source != null) {
      spellProperties.add("Source: " + spellToParse.source);
    }
    if (spellToParse.pageNo != null) {
      spellProperties.add("Page Number: " + spellToParse.pageNo);
    }
    if (spellToParse.spellResistance != null) {
      spellProperties.add("Spell Resistance: " + spellToParse.spellResistance);
    }
    if (spellToParse.targetsEffectArea != null) {
      spellProperties.add("Target Effect Area: " + spellToParse.targetsEffectArea);
    }
    return spellProperties;
  }


  Spell({this.name, this.castingTime, this.classes, this.spellListDescription, this.descriptor,
    this.duration, this.level, this.description, this.range, this.savingThrow, this.school,
    this.source, this.pageNo, this.spellResistance, this.targetsEffectArea});

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      name: json['name'],
      castingTime: json['CastingTime'],
      classes: json['Classes'],
      spellListDescription: json['SpellListDescription'],
      descriptor: json['Descriptor'],
      duration: json['Duration'],
      level: json['Level'],
      description: json['Description'],
      range: json['Range'],
      savingThrow: json['SavingThrow'],
      school: json['School'],
      source: json['Source'],
      pageNo: json['PageNumber'],
      spellResistance: json['SpellResistance'],
      targetsEffectArea: json['TargetsEffectArea']
    );
  }

}