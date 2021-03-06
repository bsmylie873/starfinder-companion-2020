//CONTRIBUTION - BRANDON 90% CONOR 10%

import 'index.dart';

//This object is used in the Spell index.
class Spell extends Index{
  //These parameters match the sfrpg_spells json fields.
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

  //This list parses the Spell index data in list strings.
  List<String> spellDetails(Spell spellToParse) {
    //This populates a list of strings for each Spell.
    List<String> spellProperties = new List();
    //Strings use != null to skip null values. This is due to the flexible
    //approach taken in the sfrpg_spell json file, having all fields as strings
    //and not including certain fields. In the future, this data set would be
    //improved with a more rigid structure with appropriate variable types.
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
    //This returns the newly made list string to the list.
    return spellProperties;
  }

  //This is the constructor for the Spell object.
  Spell({name, this.castingTime, this.classes, this.spellListDescription, this.descriptor,
    this.duration, this.level, this.description, this.range, this.savingThrow, this.school,
    this.source, this.pageNo, this.spellResistance, this.targetsEffectArea}): super(name: name);

  //This parses the json into the Spell object.
  factory Spell.fromJson(Map<String, dynamic> json) {
    final index = Index.fromJson(json);
    return Spell(
      name: index.name,
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