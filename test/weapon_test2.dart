import 'package:test/test.dart';
import '../lib/objects/weapon.dart';

void main() {
  String name1 = "name";
  String source1 = "source";
  String type1 = "type";
  String handed1 = "handed";
  String category1 = "category";
  int level1 = 0;
  int price1 = 0;
  String damage1 = "damage";
  String range1 = "range";
  String critical1 = "critical";
  String ammo1 = "ammo";
  String capacity1 = "capacity";
  String usage1 = "usage";
  String bulk1 = "bulk";
  String special1 = "special";
  bool analog1 = false;
  bool antibiological1 = false;
  bool archaic1 = false;
  bool aurora1 = false;
  bool automatic1 = false;
  bool blast1 = false;
  bool block1 = false;
  String boost1 = "boost";
  bool breach1 = false;
  bool breakdown1 = false;
  bool bright1 = false;
  String cluster1 = "cluster";
  bool conceal1 = false;
  String deconstruct1 = "deconstruct";
  bool deflect1 = false;
  bool disarm1 = false;
  String double1 = "double";
  bool drainCharge1 = false;
  bool echo1 = false;
  String entangle1 = "entangle";
  String explode1 = "explode";
  bool extinguish1 = false;
  bool feint1 = false;
  String firstArc1 = "first arc";
  bool flexibleLine1 = false;
  bool force1 = false;
  String freeHands1= "free hands";
  bool fueled1 = false;
  bool grapple1 = false;
  String gravitation1 = "gravitation";
  bool guided1 = false;
  bool harrying1 = false;
  String ignite1 = "ignite";
  bool indirect1 = false;
  bool injection1 = false;
  String integrated1 = "integrated";
  bool line1 = false;
  bool living1 = false;
  bool mindAffecting1 = false;
  bool mine1 = false;
  String modal1 = "modal";
  bool noSpecial1 = false;
  bool nonLethal1 = false;
  bool operative1 = false;
  bool penetrating1 = false;
  String polarize1 = "polarize";
  bool powered1 = false;
  String professional1 = "professional";
  bool quickReload1 = false;
  bool radioactive1 = false;
  bool reach1 = false;
  String recall1 = "recall";
  String shape1 = "shape";
  bool shells1 = false;
  String shield1 = "shield";
  String sniper1 = "sniper";
  bool stun1 = false;
  bool subtle1 = false;
  bool sunder1 = false;
  bool tail1 = false;
  bool thought1 = false;
  bool throttle1 = false;
  bool thrown1 = false;
  bool trip1 = false;
  bool unwieldy1 = false;
  bool wideLine1 = false;
  String damageRoll1 = "damage roll";
  String damageType1 = "damage type";
  String damageType2 = "damage type 2";
  int weaponTier1 = 0;
  String criticalType1 = "critical type";
  String criticalDuration1 = "critical duration";
  String criticalValue1 = "critical value";
  bool isMelee1 = true;
  bool isRanged1 = false;
  int units1 = 0;  


  Weapon testWeapon2 = new Weapon(name: name1, source: source1, type: type1, handed: handed1,
  category: category1, level: level1, price: price1, damage: damage1, range: range1,
  critical: critical1, ammo: ammo1, capacity: capacity1, usage: usage1, bulk: bulk1,
  special: special1, analog: analog1, antibiological: antibiological1, archaic: archaic1,
  aurora: aurora1, automatic: automatic1, blast: blast1, block: block1, boost: boost1,
  breach: breach1, breakdown: breakdown1, bright: bright1, cluster: cluster1, conceal: conceal1,
  deconstruct: deconstruct1, deflect: deflect1, disarm: disarm1, double: double1,
  drainCharge: drainCharge1, echo: echo1, entangle: entangle1, explode: explode1,
  extinguish: extinguish1, feint: feint1, firstArc: firstArc1, flexibleLine: flexibleLine1,
  force: force1, freeHands: freeHands1, fueled: fueled1, grapple: grapple1, gravitation: gravitation1,
  guided: guided1, harrying: harrying1, ignite: ignite1, indirect: indirect1, injection: injection1,
  integrated: integrated1, line: line1, living: living1, mindAffecting: mindAffecting1,
  mine: mine1, modal: modal1, noSpecial: noSpecial1, nonLethal: nonLethal1, operative: operative1,
  penetrating: penetrating1, polarize: polarize1, powered: powered1, professional: professional1,
  quickReload: quickReload1, radioactive: radioactive1, reach: reach1, recall: recall1,
  shape: shape1, shells: shells1, shield: shield1, sniper: sniper1, stun: stun1,
  subtle: subtle1, sunder: sunder1, tail: tail1, thought: thought1, thrown: thrown1,
  trip: trip1, unwieldy: unwieldy1, wideLine: wideLine1, damageRoll: damageRoll1,
  damageType: damageType1, damageType2: damageType2, weaponTier: weaponTier1, criticalType: criticalType1,
  criticalDuration: criticalDuration1, criticalValue: criticalValue1, isMelee: isMelee1,
  isRanged: isRanged1, units: units1);

  group('Assignment Test', () {
    test('Name should be "name"', () {
      expect(testWeapon2.name, "name");
    });

    test('Source should be "source"', () {
      expect(testWeapon2.source, "source");
    });

    test('Handed should be "handed"', () {
      expect(testWeapon2.handed, "handed");
    });

    test('Category should be "category"', () {
      expect(testWeapon2.category, "category");
    });

    test('Level should be "0"', () {
      expect(testWeapon2.level, 0);
    });

    test('Price should be "0"', () {
      expect(testWeapon2.price, 0);
    });

    test('Damage should be "damage"', () {
      expect(testWeapon2.damage, "damage");
    });

    test('Range should be "range"', () {
      expect(testWeapon2.range, "range");
    });

    test('Critical should be "critical"', () {
      expect(testWeapon2.critical, "critical");
    });

    test('Ammo should be "ammo"', () {
      expect(testWeapon2.ammo, "ammo");
    });

    test('Capacity should be "capacity"', () {
      expect(testWeapon2.capacity, "capacity");
    });

    test('Usage should be "usage"', () {
      expect(testWeapon2.usage, "usage");
    });

    test('Bulk should be "bulk"', () {
      expect(testWeapon2.bulk, "bulk");
    });

    test('Special should be "special"', () {
      expect(testWeapon2.special, "special");
    });

    test('Analog should be "false"', () {
      expect(testWeapon2.analog, false);
    });

    test('Anitbiological should be "false"', () {
      expect(testWeapon2.antibiological, false);
    });

    test('Archaic should be "false"', () {
      expect(testWeapon2.archaic, false);
    });

    test('Aurora should be "false"', () {
      expect(testWeapon2.aurora, false);
    });

    test('Automatic should be "false"', () {
      expect(testWeapon2.automatic, false);
    });

    test('Blast should be "false"', () {
      expect(testWeapon2.blast, false);
    });

    test('Block should be "false"', () {
      expect(testWeapon2.block, false);
    });

    test('Boost should be "boost"', () {
      expect(testWeapon2.boost, "boost");
    });

    test('Breach should be "false"', () {
      expect(testWeapon2.breach, false);
    });

    test('Breakdown should be "false"', () {
      expect(testWeapon2.breakdown, false);
    });

    test('Bright should be "false"', () {
      expect(testWeapon2.cluster, "cluster");
    });

    test('Conceal should be "false"', () {
      expect(testWeapon2.conceal, false);
    });

    test('Deconstruct should be "deconstruct"', () {
      expect(testWeapon2.deconstruct, "deconstruct");
    });

    test('Deflect should be "false"', () {
      expect(testWeapon2.deflect, false);
    });

    test('Disarm should be "false"', () {
      expect(testWeapon2.disarm, false);
    });

    test('Double should be "double"', () {
      expect(testWeapon2.double, "double");
    });

    test('DrainCharge should be "false"', () {
      expect(testWeapon2.drainCharge, false);
    });

    test('Echo should be "false"', () {
      expect(testWeapon2.echo, false);
    });

    test('Entangle should be "entangle"', () {
      expect(testWeapon2.entangle, "entangle");
    });

    test('Explode should be "explode"', () {
      expect(testWeapon2.explode, "explode");
    });

    test('Extinguish should be "false"', () {
      expect(testWeapon2.extinguish, false);
    });

    test('Feint should be "false"', () {
      expect(testWeapon2.feint, false);
    });

    test('FirstArc should be "first arc"', () {
      expect(testWeapon2.firstArc, "first arc");
    });

    test('Flexible Line should be "false"', () {
      expect(testWeapon2.flexibleLine, false);
    });

    test('Force should be "false"', () {
      expect(testWeapon2.force, false);
    });

    test('Free Hands should be "free hands"', () {
      expect(testWeapon2.freeHands, "free hands");
    });

    test('Fueled should be "false"', () {
      expect(testWeapon2.fueled, false);
    });

    test('Grapple should be "grapple"', () {
      expect(testWeapon2.grapple, false);
    });

    test('Gravitation should be "gravitation"', () {
      expect(testWeapon2.gravitation, "gravitation");
    });

    test('Guided should be "false"', () {
      expect(testWeapon2.guided, false);
    });

    test('Harrying should be "false"', () {
      expect(testWeapon2.harrying, false);
    });

    test('Ignite should be "ignite"', () {
      expect(testWeapon2.ignite, "ignite");
    });

    test('Indirect should be "false"', () {
      expect(testWeapon2.indirect, false);
    });

    test('Injection should be "false"', () {
      expect(testWeapon2.injection, false);
    });

    test('Integrated should be "integrated"', () {
      expect(testWeapon2.integrated, "integrated");
    });

    test('Line should be "false"', () {
      expect(testWeapon2.line, false);
    });

    test('Living should be "false"', () {
      expect(testWeapon2.living, false);
    });

    test('MindAffecting should be "mind affecting"', () {
      expect(testWeapon2.mindAffecting, false);
    });

    test('Mine should be "mine"', () {
      expect(testWeapon2.mine, false);
    });

    test('Modal should be "modal"', () {
      expect(testWeapon2.modal, "modal");
    });

    test('NoSpecial should be "no special"', () {
      expect(testWeapon2.noSpecial, false);
    });

    test('NonLethal should be "false"', () {
      expect(testWeapon2.nonLethal, false);
    });

    test('Operative should be "false"', () {
      expect(testWeapon2.operative, false);
    });

    test('Penetrative should be "false"', () {
      expect(testWeapon2.penetrating, false);
    });

    test('Polarize should be "polarize"', () {
      expect(testWeapon2.polarize, "polarize");
    });

    test('Powered should be "false"', () {
      expect(testWeapon2.powered, false);
    });

    test('Professional should be "professional"', () {
      expect(testWeapon2.professional, "professional");
    });

    test('QuickReload should be "false"', () {
      expect(testWeapon2.quickReload, false);
    });

    test('Radioactive should be "false"', () {
      expect(testWeapon2.radioactive, false);
    });

    test('Reach should be "false"', () {
      expect(testWeapon2.reach, false);
    });

    test('Recall should be "recall"', () {
      expect(testWeapon2.recall, "recall");
    });

    test('Shape should be "shape"', () {
      expect(testWeapon2.shape, "shape");
    });

    test('Shells should be "false"', () {
      expect(testWeapon2.shells, false);
    });

    test('Shield should be "shield"', () {
      expect(testWeapon2.shield, "shield");
    });

    test('Sniper should be "sniper"', () {
      expect(testWeapon2.sniper, "sniper");
    });

    test('Stun should be "false"', () {
      expect(testWeapon2.stun, false);
    });

    test('Subtle should be "false"', () {
      expect(testWeapon2.subtle, false);
    });

    test('Sunder should be "false"', () {
      expect(testWeapon2.sunder, false);
    });

    test('Tail should be "false"', () {
      expect(testWeapon2.tail, false);
    });

    test('Thought should be "false"', () {
      expect(testWeapon2.thought, false);
    });

    test('Thrown should be "false"', () {
      expect(testWeapon2.thrown, false);
    });

    test('Trip should be "false"', () {
      expect(testWeapon2.trip, false);
    });

    test('Unwieldy should be "false"', () {
      expect(testWeapon2.unwieldy, false);
    });

    test('WideLine should be "false"', () {
      expect(testWeapon2.wideLine, false);
    });

    test('DamageRoll should be "damage roll"', () {
      expect(testWeapon2.damageRoll, "damage roll");
    });

    test('DamageType1 should be "damage type"', () {
      expect(testWeapon2.damageType, "damage type");
    });

    test('DamageType should be "damage type 2"', () {
      expect(testWeapon2.damageType2, "damage type 2");
    });

    test('WeaponTier should be 0"', () {
      expect(testWeapon2.weaponTier, 0);
    });

    test('CriticalType should be "critical type"', () {
      expect(testWeapon2.criticalType, "critical type");
    });

    test('CriticalDuration should be "critical duration"', () {
      expect(testWeapon2.criticalDuration, "critical duration");
    });

    test('CriticalValue should be "critical value"', () {
      expect(testWeapon2.criticalValue, "critical value");
    });

    test('IsMelee should be "true"', () {
      expect(testWeapon2.isMelee, true);
    });

    test('IsRanged should be "false"', () {
      expect(testWeapon2.isRanged, false);
    });

    test('Units should be "0"', () {
      expect(testWeapon2.units, 0);
    });
  });
}
