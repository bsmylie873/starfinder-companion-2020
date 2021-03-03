import 'index.dart';

//This object is used in the Races index.
class Race extends Index{
  //These parameters match the sfrpg_races json fields.
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

  //This list parses the Race index data in list strings.
  List<String> raceDetails(Race raceToParse) {
    //This populates a list of strings for each Race.
    List<String> raceProperties = new List();
    //Strings use the isNotEmpty method to skip null values.
    if (raceToParse.source.isNotEmpty) {
      raceProperties.add("Source: " + raceToParse.source);
    }
    if (raceToParse.size.isNotEmpty) {
      raceProperties.add("Sizes: " + raceToParse.size);
    }
    if (raceToParse.type.isNotEmpty) {
      raceProperties.add("Type: " + raceToParse.type);
    }
    if (raceToParse.subtype.isNotEmpty) {
      raceProperties.add("Subtype: " + raceToParse.subtype);
    }
    //Integers use the isNaN method with reverse logic to skip null values.
    if (!raceToParse.hp.isNaN) {
      raceProperties.add("HP: " + raceToParse.hp.toString());
    }
    if (!raceToParse.speed.isNaN) {
      raceProperties.add("Speed: " + raceToParse.speed.toString());
    }
    if (raceToParse.abilityModifiers.isNotEmpty) {
      raceProperties.add("Ability Modifiers: " + raceToParse.abilityModifiers);
    }
    if (raceToParse.averageHeight.isNotEmpty) {
      raceProperties.add("Average Height: " + raceToParse.averageHeight);
    }
    if (raceToParse.averageWeight.isNotEmpty) {
      raceProperties.add("Average Weight: " + raceToParse.averageWeight);
    }
    if (raceToParse.ageOfMaturity.isNotEmpty) {
      raceProperties.add("Age Of Maturity: " + raceToParse.ageOfMaturity);
    }
    if (raceToParse.maximumAge.isNotEmpty) {
      raceProperties.add("Maximum Age: " + raceToParse.maximumAge);
    }
    if (!raceToParse.strMod.isNaN) {
      raceProperties.add("Strength Modifier: " + raceToParse.strMod.toString());
    }
    if (!raceToParse.dexMod.isNaN) {
      raceProperties.add("Dexterity Modifier: " + raceToParse.dexMod.toString());
    }
    if (!raceToParse.conMod.isNaN) {
      raceProperties.add("Constitution Modifier: " + raceToParse.conMod.toString());
    }
    if (!raceToParse.intMod.isNaN) {
      raceProperties.add("Intelligence Modifier: " + raceToParse.intMod.toString());
    }
    if (!raceToParse.wisMod.isNaN) {
      raceProperties.add("Wisdom Modifier: " + raceToParse.wisMod.toString());
    }
    if (!raceToParse.chaMod.isNaN) {
      raceProperties.add("Charisma Modifier: " + raceToParse.chaMod.toString());
    }
    if (!raceToParse.reflexMod.isNaN) {
      raceProperties.add("Reflex Modifier: " + raceToParse.reflexMod.toString());
    }
    if (!raceToParse.fortMod.isNaN) {
      raceProperties.add("Fortitude Modifier: " + raceToParse.fortMod.toString());
    }
    if (!raceToParse.willMod.isNaN) {
      raceProperties.add("Willpower Modifier: " + raceToParse.willMod.toString());
    }
    if (!raceToParse.acrobaticsMod.isNaN) {
      raceProperties.add("Acrobatics Modifier: " + raceToParse.acrobaticsMod.toString());
    }
    if (!raceToParse.athleticsMod.isNaN) {
      raceProperties.add("Athletics Modifier: " + raceToParse.acrobaticsMod.toString());
    }
    if (!raceToParse.bluffMod.isNaN) {
      raceProperties.add("Bluff Modifier: " + raceToParse.bluffMod.toString());
    }
    if (!raceToParse.cultureMod.isNaN) {
      raceProperties.add("Culture Modifier: " + raceToParse.cultureMod.toString());
    }
    if (!raceToParse.diplomacyMod.isNaN) {
      raceProperties.add("Diplomacy Modifier: " + raceToParse.diplomacyMod.toString());
    }
    if (!raceToParse.disguiseMod.isNaN) {
      raceProperties.add("Disguise Modifier: " + raceToParse.disguiseMod.toString());
    }
    if (!raceToParse.engineeringMod.isNaN) {
      raceProperties.add("Engineering Modifier: " + raceToParse.engineeringMod.toString());
    }
    if (!raceToParse.intimidateMod.isNaN) {
      raceProperties.add("Intimidate Modifier: " + raceToParse.intimidateMod.toString());
    }
    if (!raceToParse.lifeScienceMod.isNaN) {
      raceProperties.add("Life Science Modifier: " + raceToParse.lifeScienceMod.toString());
    }
    if (!raceToParse.mysticismMod.isNaN) {
      raceProperties.add("Mysticism Modifier: " + raceToParse.mysticismMod.toString());
    }
    if (!raceToParse.medicineMod.isNaN) {
      raceProperties.add("Medicine Modifier: " + raceToParse.medicineMod.toString());
    }
    if (!raceToParse.perceptionMod.isNaN) {
      raceProperties.add("Perception Modifier: " + raceToParse.perceptionMod.toString());
    }
    if (!raceToParse.physicalScienceMod.isNaN) {
      raceProperties.add("Physical Science Modifier: " + raceToParse.physicalScienceMod.toString());
    }
    if (!raceToParse.senseMotiveMod.isNaN) {
      raceProperties.add("Sense Motive Modifier: " + raceToParse.senseMotiveMod.toString());
    }
    if (!raceToParse.stealthMod.isNaN) {
      raceProperties.add("Stealth Modifier: " + raceToParse.senseMotiveMod.toString());
    }
    if (!raceToParse.survivalMod.isNaN) {
      raceProperties.add("Survival Modifier: " + raceToParse.survivalMod.toString());
    }
    if (!raceToParse.acMod.isNaN) {
      raceProperties.add("AC Modifier: " + raceToParse.acMod.toString());
    }
    if (!raceToParse.abilityPicks.isNaN) {
      raceProperties.add("Ability Picks: " + raceToParse.abilityPicks.toString());
    }
    if (raceToParse.skillPicks.isNaN) {
      raceProperties.add("Skill Picks: " + raceToParse.skillPicks.toString());
    }
    //This returns the newly made list string to the list.
    return raceProperties;
  }

  //This is the constructor for the Race object.
  Race({name, this.source, this.size, this.type, this.subtype,
    this.hp, this.speed, this.abilityModifiers, this.averageHeight, this.averageWeight,
    this.ageOfMaturity, this.maximumAge, this.strMod, this.dexMod, this.conMod,
    this.intMod, this.wisMod, this.chaMod, this.reflexMod, this.fortMod, this.willMod,
    this.acrobaticsMod, this.athleticsMod, this.bluffMod, this.cultureMod, this.diplomacyMod,
    this.disguiseMod, this.engineeringMod, this.intimidateMod, this.lifeScienceMod,
    this.mysticismMod, this.medicineMod, this.perceptionMod, this.physicalScienceMod,
    this.senseMotiveMod, this.stealthMod, this.survivalMod, this.acMod, this.abilityPicks,
    this.skillPicks}): super(name: name);

  //This parses the json into the Race object.
  factory Race.fromJson(Map<String, dynamic> json) {
    final index = Index.fromJson(json);
    return Race(
      name: index.name,
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
      intimidateMod: json['IntimidateMod'],
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