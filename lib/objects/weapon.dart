import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Weapon {
  String name;
  final String source;
  final String type;
  final String handed;
  final String category;
  final int level;
  final int price;
  final String damage;
  final String range;
  final String critical;
  final String ammo;
  final String capacity;
  final String usage;
  final String bulk;
  final String special;
  final bool analog;
  final bool antibiological;
  final bool archaic;
  final bool aurora;
  final bool automatic;
  final bool blast;
  final bool block;
  final String boost;
  final bool breach;
  final bool breakdown;
  final bool bright;
  final String cluster;
  final bool conceal;
  final String deconstruct;
  final bool deflect;
  final bool disarm;
  final String double;
  final bool drainCharge;
  final bool echo;
  final String entangle;
  final String explode;
  final bool extinguish;
  final bool feint;
  final String firstArc;
  final bool flexibleLine;
  final bool force;
  final String freeHands;
  final bool fueled;
  final bool grapple;
  final String gravitation;
  final bool guided;
  final bool harrying;
  final String ignite;
  final bool indirect;
  final bool injection;
  final String integrated;
  final bool line;
  final bool living;
  final bool mindAffecting;
  final bool mine;
  final String modal;
  final bool noSpecial;
  final bool nonLethal;
  final bool operative;
  final bool penetrating;
  final String polarize;
  final bool powered;
  final String professional;
  final bool quickReload;
  final bool radioactive;
  final bool reach;
  final String recall;
  final String shape;
  final bool shells;
  final String shield;
  final String sniper;
  final bool stun;
  final bool subtle;
  final bool sunder;
  final bool tail;
  final bool thought;
  final bool throttle;
  final bool thrown;
  final bool trip;
  final bool unwieldy;
  final bool wideLine;
  final String damageRoll;
  final String damageType;
  final String damageType2;
  final int weaponTier;
  final String criticalType;
  final String criticalDuration;
  final String criticalValue;
  final bool isMelee;
  final bool isRanged;
  final int units;

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("data/sfrpg_weapons.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    print(jsonString);
    print(jsonResponse);
  }

  List<String> weaponDetails(Weapon weaponToParse) {
    List<String> weaponProperties = new List();
    //weaponProperties.add("Name: " + spellToParse.name);
    if (weaponToParse.source != null) {
      weaponProperties.add("Source: " + weaponToParse.source);
    }
    if (weaponToParse.type != null) {
      weaponProperties.add("Type: " + weaponToParse.type);
    }
    if (weaponToParse.handed != null) {
      weaponProperties.add("Handedness: " + weaponToParse.handed);
    }
    if (weaponToParse.category != null) {
      weaponProperties.add("Categories: " + weaponToParse.category);
    }
    if (weaponToParse.level != null) {
      weaponProperties.add("Level: " + weaponToParse.level.toString());
    }
    if (weaponToParse.price != null) {
      weaponProperties.add("Price: " + weaponToParse.price.toString());
    }
    if (weaponToParse.damage != null) {
      weaponProperties.add("Damage: " + weaponToParse.damage);
    }
    if (weaponToParse.range != null) {
      weaponProperties.add("Range: " + weaponToParse.range);
    }
    if (weaponToParse.critical != null) {
      weaponProperties.add("Critical: " + weaponToParse.critical);
    }
    if (weaponToParse.ammo != null) {
      weaponProperties.add("Ammo: " + weaponToParse.ammo);
    }
    if (weaponToParse.capacity != null) {
      weaponProperties.add("Capacity: " + weaponToParse.capacity);
    }
    if (weaponToParse.usage != null) {
      weaponProperties.add("Usage: " + weaponToParse.usage);
    }
    if (weaponToParse.bulk != null) {
      weaponProperties.add("Bulk: " + weaponToParse.bulk);
    }
    if (weaponToParse.special != null) {
      weaponProperties.add("Special: " + weaponToParse.special);
    }
    if (weaponToParse.analog != null) {
      weaponProperties.add("Analog: " + weaponToParse.analog.toString());
    }
    if (weaponToParse.antibiological != null) {
      weaponProperties
          .add("Anitbiological: " + weaponToParse.antibiological.toString());
    }
    if (weaponToParse.archaic != null) {
      weaponProperties.add("Archaic: " + weaponToParse.archaic.toString());
    }
    if (weaponToParse.aurora != null) {
      weaponProperties.add("Aurora: " + weaponToParse.aurora.toString());
    }
    if (weaponToParse.automatic != null) {
      weaponProperties.add("Automatic: " + weaponToParse.automatic.toString());
    }
    if (weaponToParse.blast != null) {
      weaponProperties.add("Blast: " + weaponToParse.blast.toString());
    }
    if (weaponToParse.block != null) {
      weaponProperties.add("Block: " + weaponToParse.block.toString());
    }
    if (weaponToParse.boost != null) {
      weaponProperties.add("Boost: " + weaponToParse.boost.toString());
    }
    if (weaponToParse.breach != null) {
      weaponProperties.add("Breach: " + weaponToParse.breach.toString());
    }
    if (weaponToParse.breakdown != null) {
      weaponProperties.add("Breakdown: " + weaponToParse.breakdown.toString());
    }
    if (weaponToParse.bright != null) {
      weaponProperties.add("Bright: " + weaponToParse.bright.toString());
    }
    if (weaponToParse.cluster != null) {
      weaponProperties.add("Cluster: " + weaponToParse.cluster);
    }
    if (weaponToParse.conceal != null) {
      weaponProperties.add("Conceal: " + weaponToParse.conceal.toString());
    }
    if (weaponToParse.deconstruct != null) {
      weaponProperties.add("Deconstruct: " + weaponToParse.deconstruct);
    }
    if (weaponToParse.deflect != null) {
      weaponProperties.add("Deflect: " + weaponToParse.deflect.toString());
    }
    if (weaponToParse.disarm != null) {
      weaponProperties.add("Disarm: " + weaponToParse.disarm.toString());
    }
    if (weaponToParse.double != null) {
      weaponProperties.add("Double: " + weaponToParse.double);
    }
    if (weaponToParse.drainCharge != null) {
      weaponProperties
          .add("Drain Charge: " + weaponToParse.drainCharge.toString());
    }
    if (weaponToParse.echo != null) {
      weaponProperties.add("Echo: " + weaponToParse.echo.toString());
    }
    if (weaponToParse.entangle != null) {
      weaponProperties.add("Entangle: " + weaponToParse.entangle);
    }
    if (weaponToParse.explode != null) {
      weaponProperties.add("Explode: " + weaponToParse.explode);
    }
    if (weaponToParse.extinguish != null) {
      weaponProperties
          .add("Extinguish: " + weaponToParse.extinguish.toString());
    }
    if (weaponToParse.feint != null) {
      weaponProperties.add("Feint: " + weaponToParse.feint.toString());
    }
    if (weaponToParse.firstArc != null) {
      weaponProperties.add("First Arc: " + weaponToParse.firstArc);
    }
    if (weaponToParse.flexibleLine != null) {
      weaponProperties
          .add("Flexible Line: " + weaponToParse.flexibleLine.toString());
    }
    if (weaponToParse.force != null) {
      weaponProperties.add("Force: " + weaponToParse.force.toString());
    }
    if (weaponToParse.freeHands != null) {
      weaponProperties.add("Free Hands: " + weaponToParse.freeHands.toString());
    }
    if (weaponToParse.fueled != null) {
      weaponProperties.add("Fueled: " + weaponToParse.fueled.toString());
    }
    if (weaponToParse.grapple != null) {
      weaponProperties.add("Grapple: " + weaponToParse.grapple.toString());
    }
    if (weaponToParse.gravitation != null) {
      weaponProperties.add("Gravitation: " + weaponToParse.gravitation);
    }
    if (weaponToParse.guided != null) {
      weaponProperties.add("Guided: " + weaponToParse.guided.toString());
    }
    if (weaponToParse.harrying != null) {
      weaponProperties.add("Harrying: " + weaponToParse.harrying.toString());
    }
    if (weaponToParse.ignite != null) {
      weaponProperties.add("Ignite: " + weaponToParse.ignite);
    }
    if (weaponToParse.indirect != null) {
      weaponProperties.add("Indirect: " + weaponToParse.indirect.toString());
    }
    if (weaponToParse.injection != null) {
      weaponProperties.add("Injection: " + weaponToParse.injection.toString());
    }
    if (weaponToParse.integrated != null) {
      weaponProperties.add("Integrated: " + weaponToParse.integrated);
    }
    if (weaponToParse.line != null) {
      weaponProperties.add("Line: " + weaponToParse.line.toString());
    }
    if (weaponToParse.living != null) {
      weaponProperties.add("Living: " + weaponToParse.living.toString());
    }
    if (weaponToParse.mindAffecting != null) {
      weaponProperties
          .add("Mind Affecting: " + weaponToParse.mindAffecting.toString());
    }
    if (weaponToParse.mine != null) {
      weaponProperties.add("Mine: " + weaponToParse.mine.toString());
    }
    if (weaponToParse.modal != null) {
      weaponProperties.add("Modal: " + weaponToParse.modal);
    }
    if (weaponToParse.noSpecial != null) {
      weaponProperties.add("No Special: " + weaponToParse.noSpecial.toString());
    }
    if (weaponToParse.nonLethal != null) {
      weaponProperties.add("Nonlethal: " + weaponToParse.nonLethal.toString());
    }
    if (weaponToParse.operative != null) {
      weaponProperties.add("Operative: " + weaponToParse.operative.toString());
    }
    if (weaponToParse.penetrating != null) {
      weaponProperties
          .add("Penetrating: " + weaponToParse.penetrating.toString());
    }
    if (weaponToParse.polarize != null) {
      weaponProperties.add("Polarize: " + weaponToParse.polarize);
    }
    if (weaponToParse.powered != null) {
      weaponProperties.add("Powered: " + weaponToParse.powered.toString());
    }
    if (weaponToParse.professional != null) {
      weaponProperties.add("Professional: " + weaponToParse.professional);
    }
    if (weaponToParse.quickReload != null) {
      weaponProperties
          .add("Quick Reload: " + weaponToParse.quickReload.toString());
    }
    if (weaponToParse.radioactive != null) {
      weaponProperties
          .add("Radioactive: " + weaponToParse.radioactive.toString());
    }
    if (weaponToParse.reach != null) {
      weaponProperties.add("Reach: " + weaponToParse.reach.toString());
    }
    if (weaponToParse.recall != null) {
      weaponProperties.add("Recall: " + weaponToParse.recall);
    }
    if (weaponToParse.shape != null) {
      weaponProperties.add("Shape: " + weaponToParse.shape);
    }
    if (weaponToParse.shells != null) {
      weaponProperties.add("Shells: " + weaponToParse.shells.toString());
    }
    if (weaponToParse.shield != null) {
      weaponProperties.add("Shield: " + weaponToParse.shield);
    }
    if (weaponToParse.sniper != null) {
      weaponProperties.add("Sniper: " + weaponToParse.sniper);
    }
    if (weaponToParse.stun != null) {
      weaponProperties.add("Stun: " + weaponToParse.stun.toString());
    }
    if (weaponToParse.subtle != null) {
      weaponProperties.add("Subtle: " + weaponToParse.subtle.toString());
    }
    if (weaponToParse.sunder != null) {
      weaponProperties.add("Sunder: " + weaponToParse.sunder.toString());
    }
    if (weaponToParse.tail != null) {
      weaponProperties.add("Tail: " + weaponToParse.tail.toString());
    }
    if (weaponToParse.thought != null) {
      weaponProperties.add("Thought: " + weaponToParse.thought.toString());
    }
    if (weaponToParse.throttle != null) {
      weaponProperties.add("Throttle: " + weaponToParse.throttle.toString());
    }
    if (weaponToParse.thrown != null) {
      weaponProperties.add("Thrown: " + weaponToParse.thrown.toString());
    }
    if (weaponToParse.trip != null) {
      weaponProperties.add("Trip: " + weaponToParse.trip.toString());
    }
    if (weaponToParse.unwieldy != null) {
      weaponProperties.add("Unwieldy: " + weaponToParse.unwieldy.toString());
    }
    if (weaponToParse.wideLine != null) {
      weaponProperties.add("Wide Line: " + weaponToParse.wideLine.toString());
    }
    if (weaponToParse.damageRoll != null) {
      weaponProperties.add("Damage Roll: " + weaponToParse.damageRoll);
    }
    if (weaponToParse.damageType != null) {
      weaponProperties.add("Damage Type: " + weaponToParse.damageType);
    }
    if (weaponToParse.damageType2 != null) {
      weaponProperties.add("Damage Type2: " + weaponToParse.damageType2);
    }
    if (weaponToParse.weaponTier != null) {
      weaponProperties
          .add("Weapon Tier: " + weaponToParse.weaponTier.toString());
    }
    if (weaponToParse.criticalType != null) {
      weaponProperties.add("Critical Type: " + weaponToParse.criticalType);
    }
    if (weaponToParse.criticalDuration != null) {
      weaponProperties
          .add("Critical Duration: " + weaponToParse.criticalDuration);
    }
    if (weaponToParse.criticalValue != null) {
      weaponProperties.add("Critical Value: " + weaponToParse.criticalValue);
    }
    if (weaponToParse.isMelee != null) {
      weaponProperties.add("Melee: " + weaponToParse.isMelee.toString());
    }
    if (weaponToParse.isRanged != null) {
      weaponProperties.add("Ranged: " + weaponToParse.isRanged.toString());
    }
    if (weaponToParse.units != null) {
      weaponProperties.add("Units: " + weaponToParse.units.toString());
    }
    return weaponProperties;
  }

  Weapon({this.name, this.source, this.type, this.handed, this.category, this.level,
    this.price, this.damage, this.range, this.critical, this.ammo, this.capacity,
    this.usage, this.bulk, this.special, this.analog, this.antibiological, this.archaic,
    this.aurora, this.automatic, this.blast, this.block, this.boost, this.breach,
    this.breakdown, this.bright, this.cluster, this.conceal, this.deconstruct,
    this.deflect, this.disarm, this.double, this.drainCharge, this.echo, this.entangle,
    this.explode, this.extinguish, this.feint, this.firstArc, this.flexibleLine,
    this.force, this.freeHands, this.fueled, this.grapple, this.gravitation, this.guided,
    this.harrying, this.ignite, this.indirect, this.injection, this.integrated,
    this.line, this.living, this.mindAffecting, this.mine, this.modal, this.noSpecial,
    this.nonLethal, this.operative, this.penetrating, this.polarize, this.powered,
    this.professional, this.quickReload, this.radioactive, this.reach, this.recall,
    this.shape, this.shells, this.shield, this.sniper, this.stun, this.subtle,
    this.sunder, this.tail, this.thought, this.throttle, this.thrown, this.trip,
    this.unwieldy, this.wideLine, this.damageRoll, this.damageType, this.damageType2,
    this.weaponTier, this.criticalType, this.criticalDuration, this.criticalValue,
    this.isMelee, this.isRanged, this.units});

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
        name: json['Name'],
        source: json['Source'],
        type: json['Type'],
        handed: json['Handed'],
        category: json['Category'],
        level: json['Level'],
        price: json['Price'],
        damage: json['Damage'],
        range: json['Range'],
        critical: json['Critical'],
        ammo: json['Ammo'],
        capacity: json['Capacity'],
        usage: json['Usage'],
        bulk: json['Bulk'],
        special: json['Special'],
        analog: json['Analog'],
        antibiological: json['Antibiological'],
        archaic: json['Archaic'],
        aurora: json['Aurora'],
        automatic: json['Automatic'],
        blast: json['Blast'],
        block: json['Block'],
        boost: json['Boost'],
        breach: json['Breach'],
        breakdown: json['Breakdown'],
        bright: json['Bright'],
        cluster: json['Cluster'],
        conceal: json['Conceal'],
        deconstruct: json['Deconstruct'],
        deflect: json['Deflect'],
        disarm: json['Disarm'],
        double: json['Double'],
        drainCharge: json['DrainCharge'],
        echo: json['Echo'],
        entangle: json['Entangle'],
        explode: json['Explode'],
        extinguish: json['Extinguish'],
        feint: json['Feint'],
        firstArc: json['FirstArc'],
        flexibleLine: json['FlexibleLine'],
        force: json['Force'],
        freeHands: json['FreeHands'],
        fueled: json['Fueled'],
        grapple: json['Grapple'],
        gravitation: json['Gravitation'],
        guided: json['Guided'],
        harrying: json['Harrying'],
        ignite: json['Ignite'],
        indirect: json['Indirect'],
        injection: json['Injection'],
        integrated: json['Integrated'],
        line: json['Line'],
        living: json['Living'],
        mindAffecting: json['MindAffecting'],
        mine: json['Mine'],
        modal: json['Modal'],
        noSpecial: json['NoSpecial'],
        nonLethal: json['NonLethal'],
        operative: json['Operative'],
        penetrating: json['Penetrating'],
        polarize: json['Polarize'],
        powered: json['Powered'],
        professional: json['Professional'],
        quickReload: json['QuickReload'],
        radioactive: json['Radioactive'],
        reach: json['Reach'],
        recall: json['Recall'],
        shape: json['Shape'],
        shells: json['Shells'],
        shield: json['Shield'],
        sniper: json['Sniper'],
        stun: json['Stun'],
        subtle: json['Subtle'],
        sunder: json['Sunder'],
        tail: json['Tail'],
        thought: json['Thought'],
        throttle: json['Throttle'],
        thrown: json['Thrown'],
        trip: json['Trip'],
        unwieldy: json['Unwieldy'],
        wideLine: json['WideLine'],
        damageRoll: json['DamageRoll'],
        damageType: json['DamageType'],
        damageType2: json['DamageType2'],
        weaponTier: json['WeaponTier'],
        criticalType: json['CriticalType'],
        criticalDuration: json['CriticalDuration'],
        criticalValue: json['CriticalValue'],
        isMelee: json['IsMelee'],
        isRanged: json['IsRanged'],
        units: json['Units']
    );
  }
}
