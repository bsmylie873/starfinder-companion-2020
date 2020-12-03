import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Spell {
  String name;
  final String castingTime;
  final String classes;
  final String spellListDescription;
  final String duration;
  final String level;
  final String description;
  final String range;
  final String savingThrow;
  final String school;
  final String source;
  final String pageNo;
  final String spellResistance;
  final String targetEffectArea;

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("data/starfinderMagicAndSpells.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    print(jsonString);
    print(jsonResponse);
  }

  List<String> spellDetails(Spell spellToParse) {
    List<String> spellProperties = new List();
    spellProperties.add("Name: " + spellToParse.name);
    spellProperties.add("Casting Time: " + spellToParse.castingTime);
    spellProperties.add("Classes: " + spellToParse.classes);
    spellProperties.add("Spell List Description: " + spellToParse.spellListDescription);
    spellProperties.add("Duration: " + spellToParse.duration);
    spellProperties.add("Level: " + spellToParse.level);
    spellProperties.add("Range: " + spellToParse.range);
    if (spellToParse.savingThrow != null) {
      spellProperties.add("Saving Throw: " + spellToParse.savingThrow);
    }
    spellProperties.add("School: " + spellToParse.school);
    spellProperties.add("Source: " + spellToParse.source);
    spellProperties.add("Page Number: " + spellToParse.pageNo);
    if (spellToParse.spellResistance != null) {
      spellProperties.add("Spell Resistance: " + spellToParse.spellResistance);
    }
    if (spellToParse.targetEffectArea != null) {
      spellProperties.add("Target Effect Area: " + spellToParse.targetEffectArea);
    }
    return spellProperties;
  }


  Spell({this.name, this.castingTime, this.classes, this.spellListDescription,
    this.duration, this.level, this.description, this.range, this.savingThrow, this.school,
    this.source, this.pageNo, this.spellResistance, this.targetEffectArea});

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      name: json['name'],
      castingTime: json['CastingTime'],
      classes: json['Classes'],
      spellListDescription: json['SpellListDescription'],
      duration: json['Duration'],
      level: json['Level'],
      description: json['Description'],
      range: json['Range'],
      savingThrow: json['SavingThrow'],
      school: json['School'],
      source: json['Source'],
      pageNo: json['PageNumber'],
      spellResistance: json['SpellResistance'],
      targetEffectArea: json['TargetEffectArea']
    );
  }

}