import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Spell {
  final String name;
  final String castingTime;
  final String classes;
  final String spellListDescritpion;
  final String duration;
  final int level;
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

  Spell({this.name, this.castingTime, this.classes, this.spellListDescritpion,
    this.duration, this.level, this.description, this.range, this.savingThrow, this.school,
    this.source, this.pageNo, this.spellResistance, this.targetEffectArea});

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      name: json['name'],
      castingTime: json['CastingTime'],
      classes: json['Classes'],
      spellListDescritpion: json['SpellListDescription'],
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