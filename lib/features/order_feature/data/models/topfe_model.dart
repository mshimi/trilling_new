import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:trilling_web/features/order_feature/domain/entities/topfliste.dart';

class TopflisteModel {
  int topf5L;
  int topf9L;
  int topfEckig;
  int topf12L;
  int topf7L;
  int topf3L;
  int steinTopf;
  int brater;
  int chafingDish;
  int auflaufForm;
  int warmebrucke;
  int chrom;
  int holzbrett;
  int schussel;
  int dip;
  int kanne;

  int korb;
  int butterteller;
  int transportbox;
  int vorlegebesteck;
  int kaffeTeller;
  int teller;
  int eLoffel;
  int tLoffel;
  int messer;

  List<String> topfe = [
    'Th.-Topf, 5 l',
    'Th.-Topf, 9 l',
    'Th.-Topf, eckig',
    'Th.-Topf, 12 l',
    'Th.-Topf, 7 l',
    'Th.-Topf, 3 l',
    'Steintopf',
    'Bräter',
    'Chäfing Dish',
    'Auflauf-Form',
    'Wärmebrücke mit   Platte u. Brett',
    'Chrom- / Melaminplatte',
    'Holz- / Schieferbrett',
    'Schüssel',
    'Dip- / Weckgläser',
    'Kanne',
    'Korb',
    'Butterteller',
    'Transportbox',
    'Vorlegebesteck',
    'Kaffe-Teller',
    'Teller',
    'E-Löffel',
    'T-Löffel',
    'Messer',
  ];
  TopflisteModel({
    this.topf5L = 0,
    this.topf9L = 0,
    this.topfEckig = 0,
    this.topf12L = 0,
    this.topf7L = 0,
    this.topf3L = 0,
    this.steinTopf = 0,
    this.brater = 0,
    this.chafingDish = 0,
    this.auflaufForm = 0,
    this.warmebrucke = 0,
    this.chrom = 0,
    this.holzbrett = 0,
    this.schussel = 0,
    this.dip = 0,
    this.kanne = 0,
    this.korb = 0,
    this.butterteller = 0,
    this.transportbox = 0,
    this.vorlegebesteck = 0,
    this.kaffeTeller = 0,
    this.teller = 0,
    this.eLoffel = 0,
    this.tLoffel = 0,
    this.messer = 0,
  });

  TopflisteModel copyWith({
    int? topf5L,
    int? topf9L,
    int? topfEckig,
    int? topf12L,
    int? topf7L,
    int? topf3L,
    int? steinTopf,
    int? brater,
    int? chafingDish,
    int? auflaufForm,
    int? warmebrucke,
    int? chrom,
    int? holzbrett,
    int? schussel,
    int? dip,
    int? kanne,
    int? korb,
    int? butterteller,
    int? transportbox,
    int? vorlegebesteck,
    int? kaffeTeller,
    int? teller,
    int? eLoffel,
    int? tLoffel,
    int? messer,
    List<String>? topfe,
  }) {
    return TopflisteModel(
      topf5L: topf5L ?? this.topf5L,
      topf9L: topf9L ?? this.topf9L,
      topfEckig: topfEckig ?? this.topfEckig,
      topf12L: topf12L ?? this.topf12L,
      topf7L: topf7L ?? this.topf7L,
      topf3L: topf3L ?? this.topf3L,
      steinTopf: steinTopf ?? this.steinTopf,
      brater: brater ?? this.brater,
      chafingDish: chafingDish ?? this.chafingDish,
      auflaufForm: auflaufForm ?? this.auflaufForm,
      warmebrucke: warmebrucke ?? this.warmebrucke,
      chrom: chrom ?? this.chrom,
      holzbrett: holzbrett ?? this.holzbrett,
      schussel: schussel ?? this.schussel,
      dip: dip ?? this.dip,
      kanne: kanne ?? this.kanne,
      korb: korb ?? this.korb,
      butterteller: butterteller ?? this.butterteller,
      transportbox: transportbox ?? this.transportbox,
      vorlegebesteck: vorlegebesteck ?? this.vorlegebesteck,
      kaffeTeller: kaffeTeller ?? this.kaffeTeller,
      teller: teller ?? this.teller,
      eLoffel: eLoffel ?? this.eLoffel,
      tLoffel: tLoffel ?? this.tLoffel,
      messer: messer ?? this.messer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'topf5L': topf5L,
      'topf9L': topf9L,
      'topfEckig': topfEckig,
      'topf12L': topf12L,
      'topf7L': topf7L,
      'topf3L': topf3L,
      'steinTopf': steinTopf,
      'brater': brater,
      'chafingDish': chafingDish,
      'auflaufForm': auflaufForm,
      'warmebrucke': warmebrucke,
      'chrom': chrom,
      'holzbrett': holzbrett,
      'schussel': schussel,
      'dip': dip,
      'kanne': kanne,
      'korb': korb,
      'butterteller': butterteller,
      'transportbox': transportbox,
      'vorlegebesteck': vorlegebesteck,
      'kaffeTeller': kaffeTeller,
      'teller': teller,
      'eLoffel': eLoffel,
      'tLoffel': tLoffel,
      'messer': messer,
    };
  }

  factory TopflisteModel.fromMap(Map<String, dynamic> map) {
    return TopflisteModel(
      topf5L: map['topf5L']?.toInt() ?? 0,
      topf9L: map['topf9L']?.toInt() ?? 0,
      topfEckig: map['topfEckig']?.toInt() ?? 0,
      topf12L: map['topf12L']?.toInt() ?? 0,
      topf7L: map['topf7L']?.toInt() ?? 0,
      topf3L: map['topf3L']?.toInt() ?? 0,
      steinTopf: map['steinTopf']?.toInt() ?? 0,
      brater: map['brater']?.toInt() ?? 0,
      chafingDish: map['chafingDish']?.toInt() ?? 0,
      auflaufForm: map['auflaufForm']?.toInt() ?? 0,
      warmebrucke: map['warmebrucke']?.toInt() ?? 0,
      chrom: map['chrom']?.toInt() ?? 0,
      holzbrett: map['holzbrett']?.toInt() ?? 0,
      schussel: map['schussel']?.toInt() ?? 0,
      dip: map['dip']?.toInt() ?? 0,
      kanne: map['kanne']?.toInt() ?? 0,
      korb: map['korb']?.toInt() ?? 0,
      butterteller: map['butterteller']?.toInt() ?? 0,
      transportbox: map['transportbox']?.toInt() ?? 0,
      vorlegebesteck: map['vorlegebesteck']?.toInt() ?? 0,
      kaffeTeller: map['kaffeTeller']?.toInt() ?? 0,
      teller: map['teller']?.toInt() ?? 0,
      eLoffel: map['eLoffel']?.toInt() ?? 0,
      tLoffel: map['tLoffel']?.toInt() ?? 0,
      messer: map['messer']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TopflisteModel.fromJson(String source) =>
      TopflisteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TopfeModel(topf5L: $topf5L, topf9L: $topf9L, topfEckig: $topfEckig, topf12L: $topf12L, topf7L: $topf7L, topf3L: $topf3L, steinTopf: $steinTopf, brater: $brater, chafingDish: $chafingDish, auflaufForm: $auflaufForm, warmebrucke: $warmebrucke, chrom: $chrom, holzbrett: $holzbrett, schussel: $schussel, dip: $dip, kanne: $kanne, korb: $korb, butterteller: $butterteller, transportbox: $transportbox, vorlegebesteck: $vorlegebesteck, kaffeTeller: $kaffeTeller, teller: $teller, eLoffel: $eLoffel, tLoffel: $tLoffel, messer: $messer, topfe: $topfe)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TopflisteModel &&
        other.topf5L == topf5L &&
        other.topf9L == topf9L &&
        other.topfEckig == topfEckig &&
        other.topf12L == topf12L &&
        other.topf7L == topf7L &&
        other.topf3L == topf3L &&
        other.steinTopf == steinTopf &&
        other.brater == brater &&
        other.chafingDish == chafingDish &&
        other.auflaufForm == auflaufForm &&
        other.warmebrucke == warmebrucke &&
        other.chrom == chrom &&
        other.holzbrett == holzbrett &&
        other.schussel == schussel &&
        other.dip == dip &&
        other.kanne == kanne &&
        other.korb == korb &&
        other.butterteller == butterteller &&
        other.transportbox == transportbox &&
        other.vorlegebesteck == vorlegebesteck &&
        other.kaffeTeller == kaffeTeller &&
        other.teller == teller &&
        other.eLoffel == eLoffel &&
        other.tLoffel == tLoffel &&
        other.messer == messer;
  }

  @override
  int get hashCode {
    return topf5L.hashCode ^
        topf9L.hashCode ^
        topfEckig.hashCode ^
        topf12L.hashCode ^
        topf7L.hashCode ^
        topf3L.hashCode ^
        steinTopf.hashCode ^
        brater.hashCode ^
        chafingDish.hashCode ^
        auflaufForm.hashCode ^
        warmebrucke.hashCode ^
        chrom.hashCode ^
        holzbrett.hashCode ^
        schussel.hashCode ^
        dip.hashCode ^
        kanne.hashCode ^
        korb.hashCode ^
        butterteller.hashCode ^
        transportbox.hashCode ^
        vorlegebesteck.hashCode ^
        kaffeTeller.hashCode ^
        teller.hashCode ^
        eLoffel.hashCode ^
        tLoffel.hashCode ^
        messer.hashCode;
  }

  List<Map<String, int>> topfeAsMap() {
    return [
      {topfe[0]: topf5L},
      {topfe[1]: topf9L},
      {topfe[2]: topfEckig},
      {topfe[3]: topf12L},
      {topfe[4]: topf7L},
      {topfe[5]: topf3L},
      {topfe[6]: steinTopf},
      {topfe[7]: brater},
      {topfe[8]: chafingDish},
      {topfe[9]: auflaufForm},
      {topfe[10]: warmebrucke},
      {topfe[11]: chrom},
      {topfe[12]: holzbrett},
      {topfe[13]: schussel},
      {topfe[14]: dip},
      {topfe[15]: kanne},
      {topfe[16]: korb},
      {topfe[17]: butterteller},
      {topfe[18]: transportbox},
      {topfe[19]: vorlegebesteck},
      {topfe[20]: kaffeTeller},
      {topfe[21]: teller},
      {topfe[22]: eLoffel},
      {topfe[23]: tLoffel},
      {topfe[24]: messer},
    ];
  }

  Topfliste toDomain() {
    return Topfliste(
      topf12L: topf12L,
      topf3L: topf3L,
      topf5L: topf5L,
      tLoffel: tLoffel,
      teller: teller,
      topf7L: topf7L,
      topf9L: topf9L,
      topfEckig: topfEckig,
      transportbox: transportbox,
      kaffeTeller: kaffeTeller,
      steinTopf: steinTopf,
      messer: messer,
      warmebrucke: warmebrucke,
      eLoffel: eLoffel,
      auflaufForm: auflaufForm,
      schussel: schussel,
      dip: dip,
      chafingDish: chafingDish,
      chrom: chrom,
      vorlegebesteck: vorlegebesteck,
      brater: brater,
    );
  }

  factory TopflisteModel.fromDomain(Topfliste topfliste) {
    return TopflisteModel(
      topf12L: topfliste.topf12L,
      topf3L: topfliste.topf3L,
      topf5L: topfliste.topf5L,
      tLoffel: topfliste.tLoffel,
      teller: topfliste.teller,
      topf7L: topfliste.topf7L,
      topf9L: topfliste.topf9L,
      topfEckig: topfliste.topfEckig,
      transportbox: topfliste.transportbox,
      kaffeTeller: topfliste.kaffeTeller,
      steinTopf: topfliste.steinTopf,
      messer: topfliste.messer,
      warmebrucke: topfliste.warmebrucke,
      eLoffel: topfliste.eLoffel,
      auflaufForm: topfliste.auflaufForm,
      schussel: topfliste.schussel,
      dip: topfliste.dip,
      chafingDish: topfliste.chafingDish,
      chrom: topfliste.chrom,
      vorlegebesteck: topfliste.vorlegebesteck,
      brater: topfliste.brater,
    );
  }
}
