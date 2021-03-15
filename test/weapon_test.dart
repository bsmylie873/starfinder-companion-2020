import 'package:test/test.dart';
import '../lib/objects/index.dart';
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
  String freeHands1 = "free hands";
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

  Index testIndex = new Index(name: name1);

  Weapon testWeapon = new Weapon(
      name: name1,
      source: source1,
      type: type1,
      handed: handed1,
      category: category1,
      level: level1,
      price: price1,
      damage: damage1,
      range: range1,
      critical: critical1,
      ammo: ammo1,
      capacity: capacity1,
      usage: usage1,
      bulk: bulk1,
      special: special1,
      analog: analog1,
      antibiological: antibiological1,
      archaic: archaic1,
      aurora: aurora1,
      automatic: automatic1,
      blast: blast1,
      block: block1,
      boost: boost1,
      breach: breach1,
      breakdown: breakdown1,
      bright: bright1,
      cluster: cluster1,
      conceal: conceal1,
      deconstruct: deconstruct1,
      deflect: deflect1,
      disarm: disarm1,
      double: double1,
      drainCharge: drainCharge1,
      echo: echo1,
      entangle: entangle1,
      explode: explode1,
      extinguish: extinguish1,
      feint: feint1,
      firstArc: firstArc1,
      flexibleLine: flexibleLine1,
      force: force1,
      freeHands: freeHands1,
      fueled: fueled1,
      grapple: grapple1,
      gravitation: gravitation1,
      guided: guided1,
      harrying: harrying1,
      ignite: ignite1,
      indirect: indirect1,
      injection: injection1,
      integrated: integrated1,
      line: line1,
      living: living1,
      mindAffecting: mindAffecting1,
      mine: mine1,
      modal: modal1,
      noSpecial: noSpecial1,
      nonLethal: nonLethal1,
      operative: operative1,
      penetrating: penetrating1,
      polarize: polarize1,
      powered: powered1,
      professional: professional1,
      quickReload: quickReload1,
      radioactive: radioactive1,
      reach: reach1,
      recall: recall1,
      shape: shape1,
      shells: shells1,
      shield: shield1,
      sniper: sniper1,
      stun: stun1,
      subtle: subtle1,
      sunder: sunder1,
      tail: tail1,
      thought: thought1,
      throttle: throttle1,
      thrown: thrown1,
      trip: trip1,
      unwieldy: unwieldy1,
      wideLine: wideLine1,
      damageRoll: damageRoll1,
      damageType: damageType1,
      damageType2: damageType2,
      weaponTier: weaponTier1,
      criticalType: criticalType1,
      criticalDuration: criticalDuration1,
      criticalValue: criticalValue1,
      isMelee: isMelee1,
      isRanged: isRanged1,
      units: units1);

  Weapon testWeapon2 = new Weapon(
      name: testIndex.name,
      source: source1,
      type: type1,
      handed: handed1,
      category: category1,
      level: level1,
      price: price1,
      damage: damage1,
      range: range1,
      critical: critical1,
      ammo: ammo1,
      capacity: capacity1,
      usage: usage1,
      bulk: bulk1,
      special: special1,
      analog: analog1,
      antibiological: antibiological1,
      archaic: archaic1,
      aurora: aurora1,
      automatic: automatic1,
      blast: blast1,
      block: block1,
      boost: boost1,
      breach: breach1,
      breakdown: breakdown1,
      bright: bright1,
      cluster: cluster1,
      conceal: conceal1,
      deconstruct: deconstruct1,
      deflect: deflect1,
      disarm: disarm1,
      double: double1,
      drainCharge: drainCharge1,
      echo: echo1,
      entangle: entangle1,
      explode: explode1,
      extinguish: extinguish1,
      feint: feint1,
      firstArc: firstArc1,
      flexibleLine: flexibleLine1,
      force: force1,
      freeHands: freeHands1,
      fueled: fueled1,
      grapple: grapple1,
      gravitation: gravitation1,
      guided: guided1,
      harrying: harrying1,
      ignite: ignite1,
      indirect: indirect1,
      injection: injection1,
      integrated: integrated1,
      line: line1,
      living: living1,
      mindAffecting: mindAffecting1,
      mine: mine1,
      modal: modal1,
      noSpecial: noSpecial1,
      nonLethal: nonLethal1,
      operative: operative1,
      penetrating: penetrating1,
      polarize: polarize1,
      powered: powered1,
      professional: professional1,
      quickReload: quickReload1,
      radioactive: radioactive1,
      reach: reach1,
      recall: recall1,
      shape: shape1,
      shells: shells1,
      shield: shield1,
      sniper: sniper1,
      stun: stun1,
      subtle: subtle1,
      sunder: sunder1,
      tail: tail1,
      thought: thought1,
      throttle: throttle1,
      thrown: thrown1,
      trip: trip1,
      unwieldy: unwieldy1,
      wideLine: wideLine1,
      damageRoll: damageRoll1,
      damageType: damageType1,
      damageType2: damageType2,
      weaponTier: weaponTier1,
      criticalType: criticalType1,
      criticalDuration: criticalDuration1,
      criticalValue: criticalValue1,
      isMelee: isMelee1,
      isRanged: isRanged1,
      units: units1);

  group('Assignment Test', () {
    test('Name should be "name"', () {
      expect(testWeapon.name, "name");
    });
    test('Name should be "name"', () {
      expect(testWeapon2.name, "name");
    });

    //Mutability test
    test ('Name should be "newName"', () {
      testWeapon.name = "newName";
      expect(testWeapon.name, "newName");
    });

    test('Source should be "source"', () {
      expect(testWeapon.source, "source");
    });

    test('Handed should be "handed"', () {
      expect(testWeapon.handed, "handed");
    });

    test('Category should be "category"', () {
      expect(testWeapon.category, "category");
    });

    test('Level should be "0"', () {
      expect(testWeapon.level, 0);
    });

    test('Price should be "0"', () {
      expect(testWeapon.price, 0);
    });

    test('Damage should be "damage"', () {
      expect(testWeapon.damage, "damage");
    });

    test('Range should be "range"', () {
      expect(testWeapon.range, "range");
    });

    test('Critical should be "critical"', () {
      expect(testWeapon.critical, "critical");
    });

    test('Ammo should be "ammo"', () {
      expect(testWeapon.ammo, "ammo");
    });

    test('Capacity should be "capacity"', () {
      expect(testWeapon.capacity, "capacity");
    });

    test('Usage should be "usage"', () {
      expect(testWeapon.usage, "usage");
    });

    test('Bulk should be "bulk"', () {
      expect(testWeapon.bulk, "bulk");
    });

    test('Special should be "special"', () {
      expect(testWeapon.special, "special");
    });

    test('Analog should be "false"', () {
      expect(testWeapon.analog, false);
    });

    test('Anitbiological should be "false"', () {
      expect(testWeapon.antibiological, false);
    });

    test('Archaic should be "false"', () {
      expect(testWeapon.archaic, false);
    });

    test('Aurora should be "false"', () {
      expect(testWeapon.aurora, false);
    });

    test('Automatic should be "false"', () {
      expect(testWeapon.automatic, false);
    });

    test('Blast should be "false"', () {
      expect(testWeapon.blast, false);
    });

    test('Block should be "false"', () {
      expect(testWeapon.block, false);
    });

    test('Boost should be "boost"', () {
      expect(testWeapon.boost, "boost");
    });

    test('Breach should be "false"', () {
      expect(testWeapon.breach, false);
    });

    test('Breakdown should be "false"', () {
      expect(testWeapon.breakdown, false);
    });

    test('Bright should be "false"', () {
      expect(testWeapon.cluster, "cluster");
    });

    test('Conceal should be "false"', () {
      expect(testWeapon.conceal, false);
    });

    test('Deconstruct should be "deconstruct"', () {
      expect(testWeapon.deconstruct, "deconstruct");
    });

    test('Deflect should be "false"', () {
      expect(testWeapon.deflect, false);
    });

    test('Disarm should be "false"', () {
      expect(testWeapon.disarm, false);
    });

    test('Double should be "double"', () {
      expect(testWeapon.double, "double");
    });

    test('DrainCharge should be "false"', () {
      expect(testWeapon.drainCharge, false);
    });

    test('Echo should be "false"', () {
      expect(testWeapon.echo, false);
    });

    test('Entangle should be "entangle"', () {
      expect(testWeapon.entangle, "entangle");
    });

    test('Explode should be "explode"', () {
      expect(testWeapon.explode, "explode");
    });

    test('Extinguish should be "false"', () {
      expect(testWeapon.extinguish, false);
    });

    test('Feint should be "false"', () {
      expect(testWeapon.feint, false);
    });

    test('FirstArc should be "first arc"', () {
      expect(testWeapon.firstArc, "first arc");
    });

    test('Flexible Line should be "false"', () {
      expect(testWeapon.flexibleLine, false);
    });

    test('Force should be "false"', () {
      expect(testWeapon.force, false);
    });

    test('Free Hands should be "free hands"', () {
      expect(testWeapon.freeHands, "free hands");
    });

    test('Fueled should be "false"', () {
      expect(testWeapon.fueled, false);
    });

    test('Grapple should be "grapple"', () {
      expect(testWeapon.grapple, false);
    });

    test('Gravitation should be "gravitation"', () {
      expect(testWeapon.gravitation, "gravitation");
    });

    test('Guided should be "false"', () {
      expect(testWeapon.guided, false);
    });

    test('Harrying should be "false"', () {
      expect(testWeapon.harrying, false);
    });

    test('Ignite should be "ignite"', () {
      expect(testWeapon.ignite, "ignite");
    });

    test('Indirect should be "false"', () {
      expect(testWeapon.indirect, false);
    });

    test('Injection should be "false"', () {
      expect(testWeapon.injection, false);
    });

    test('Integrated should be "integrated"', () {
      expect(testWeapon.integrated, "integrated");
    });

    test('Line should be "false"', () {
      expect(testWeapon.line, false);
    });

    test('Living should be "false"', () {
      expect(testWeapon.living, false);
    });

    test('MindAffecting should be "mind affecting"', () {
      expect(testWeapon.mindAffecting, false);
    });

    test('Mine should be "mine"', () {
      expect(testWeapon.mine, false);
    });

    test('Modal should be "modal"', () {
      expect(testWeapon.modal, "modal");
    });

    test('NoSpecial should be "no special"', () {
      expect(testWeapon.noSpecial, false);
    });

    test('NonLethal should be "false"', () {
      expect(testWeapon.nonLethal, false);
    });

    test('Operative should be "false"', () {
      expect(testWeapon.operative, false);
    });

    test('Penetrative should be "false"', () {
      expect(testWeapon.penetrating, false);
    });

    test('Polarize should be "polarize"', () {
      expect(testWeapon.polarize, "polarize");
    });

    test('Powered should be "false"', () {
      expect(testWeapon.powered, false);
    });

    test('Professional should be "professional"', () {
      expect(testWeapon.professional, "professional");
    });

    test('QuickReload should be "false"', () {
      expect(testWeapon.quickReload, false);
    });

    test('Radioactive should be "false"', () {
      expect(testWeapon.radioactive, false);
    });

    test('Reach should be "false"', () {
      expect(testWeapon.reach, false);
    });

    test('Recall should be "recall"', () {
      expect(testWeapon.recall, "recall");
    });

    test('Shape should be "shape"', () {
      expect(testWeapon.shape, "shape");
    });

    test('Shells should be "false"', () {
      expect(testWeapon.shells, false);
    });

    test('Shield should be "shield"', () {
      expect(testWeapon.shield, "shield");
    });

    test('Sniper should be "sniper"', () {
      expect(testWeapon.sniper, "sniper");
    });

    test('Stun should be "false"', () {
      expect(testWeapon.stun, false);
    });

    test('Subtle should be "false"', () {
      expect(testWeapon.subtle, false);
    });

    test('Sunder should be "false"', () {
      expect(testWeapon.sunder, false);
    });

    test('Tail should be "false"', () {
      expect(testWeapon.tail, false);
    });

    test('Thought should be "false"', () {
      expect(testWeapon.thought, false);
    });

    test('Throttle should be "false"', () {
      expect(testWeapon.thought, false);
    });

    test('Thrown should be "false"', () {
      expect(testWeapon.thrown, false);
    });

    test('Trip should be "false"', () {
      expect(testWeapon.trip, false);
    });

    test('Unwieldy should be "false"', () {
      expect(testWeapon.unwieldy, false);
    });

    test('WideLine should be "false"', () {
      expect(testWeapon.wideLine, false);
    });

    test('DamageRoll should be "damage roll"', () {
      expect(testWeapon.damageRoll, "damage roll");
    });

    test('DamageType1 should be "damage type"', () {
      expect(testWeapon.damageType, "damage type");
    });

    test('DamageType should be "damage type 2"', () {
      expect(testWeapon.damageType2, "damage type 2");
    });

    test('WeaponTier should be 0"', () {
      expect(testWeapon.weaponTier, 0);
    });

    test('CriticalType should be "critical type"', () {
      expect(testWeapon.criticalType, "critical type");
    });

    test('CriticalDuration should be "critical duration"', () {
      expect(testWeapon.criticalDuration, "critical duration");
    });

    test('CriticalValue should be "critical value"', () {
      expect(testWeapon.criticalValue, "critical value");
    });

    test('IsMelee should be "true"', () {
      expect(testWeapon.isMelee, true);
    });

    test('IsRanged should be "false"', () {
      expect(testWeapon.isRanged, false);
    });

    test('Units should be "0"', () {
      expect(testWeapon.units, 0);
    });
  });
}
