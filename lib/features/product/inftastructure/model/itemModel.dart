import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trilling_web/features/product/domain/entities/item.dart';

class ItemModel {
  String id;
  String titel;
  String descreption;
  List<String> allergenicSubstances;
  List<String> additives;
  List<Map<int, String>> formType;
  double priceProPerson;
  int minPax;

  ItemModel({
    required this.id,
    required this.titel,
    required this.descreption,
    required this.allergenicSubstances,
    required this.additives,
    required this.formType,
    required this.priceProPerson,
    required this.minPax,
  });

  factory ItemModel.fromDomain(Item item) {
    return ItemModel(
        id: item.id,
        titel: item.titel,
        descreption: item.descreption,
        allergenicSubstances: item.allergenicSubstances,
        additives: item.additives,
        formType: item.formTypeToModel(),
        priceProPerson: item.priceProPerson,
        minPax: item.minPax);
  }

  Item toDomain() {
    List<Map<int, FormType>> list = [];
    formType.forEach(
      (element) {
        int key = int.parse(element.keys.toString());
        FormType formType;

        switch (element.values.toString()) {
          case 'FormType.AUFLAUF':
            formType = FormType.AUFLAUF;
            break;
          case 'FormType.CHROMPLATTE':
            formType = FormType.CHROMPLATTE;
            break;
          case 'FormType.ECKIG':
            formType = FormType.ECKIG;
            break;
          case 'FormType.FlACH':
            formType = FormType.FlACH;
            break;
          case 'FormType.KORB':
            formType = FormType.KORB;
            break;
          case 'FormType.MINIFLACH':
            formType = FormType.MINIFLACH;
            break;
          case 'FormType.SCHUESSEL':
            formType = FormType.SCHUESSEL;
            break;
          case 'FormType.STEINTOPF':
            formType = FormType.STEINTOPF;
            break;
          case 'FormType.TOPF12L':
            formType = FormType.TOPF12L;
            break;
          case 'FormType.TOPF3L':
            formType = FormType.TOPF3L;
            break;
          case 'FormType.TOPF7L':
            formType = FormType.TOPF7L;
            break;

          default:
            formType = FormType.NONE;
        }

        Map<int, FormType> map = {key: formType};
        list.add(map);
      },
    );

    return Item(
        additives: additives,
        titel: titel,
        descreption: descreption,
        allergenicSubstances: allergenicSubstances,
        id: id,
        minPax: minPax,
        priceProPerson: priceProPerson,
        formType: list);
  }

  ItemModel copyWith({
    String? id,
    String? titel,
    String? descreption,
    List<String>? allergenicSubstances,
    List<String>? additives,
    List<Map<int, String>>? formType,
    double? priceProPerson,
    int? minPax,
  }) {
    return ItemModel(
      id: id ?? this.id,
      titel: titel ?? this.titel,
      descreption: descreption ?? this.descreption,
      allergenicSubstances: allergenicSubstances ?? this.allergenicSubstances,
      additives: additives ?? this.additives,
      formType: formType ?? this.formType,
      priceProPerson: priceProPerson ?? this.priceProPerson,
      minPax: minPax ?? this.minPax,
    );
  }

  factory ItemModel.fromMap(Map map) {
    return ItemModel(
        id: map['id'],
        titel: map['titel'],
        descreption: map['descreption'],
        allergenicSubstances: map['allergenicSubstances'],
        additives: map['additives'],
        formType: map['formType'],
        priceProPerson: map['priceProPerson'],
        minPax: map['minPax']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titel': titel,
      'descreption': descreption,
      'allergenicSubstances': allergenicSubstances,
      'additives': additives,
      'formType': formType,
      'priceProPerson': priceProPerson,
      'minPax': minPax,
    };
  }

  factory ItemModel.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> userData) {
    return ItemModel.fromMap(userData.data()!);
  }
}
