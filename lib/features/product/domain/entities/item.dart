class Item {
  String id;
  String titel;
  String descreption;
  List<String> allergenicSubstances;
  List<String> additives;
  List<Map<int, FormType>> formType;
  double priceProPerson;
  int minPax;
  Item({
    required this.id,
    required this.titel,
    required this.descreption,
    required this.allergenicSubstances,
    required this.additives,
    required this.formType,
    required this.priceProPerson,
    required this.minPax,
  });

  List<Map<int, String>> formTypeToModel() {
    List<Map<int, String>> list = [];

    formType.forEach((map) {
      String value = map.values.toString();
      int key = int.parse(map.keys.toString());
      Map<int, String> mapToString = {key: value};
      list.add(mapToString);
    });
    return list;
  }
}

enum FormType {
  FlACH,
  MINIFLACH,
  ECKIG,
  TOPF12L,
  TOPF7L,
  TOPF3L,
  STEINTOPF,
  AUFLAUF,
  CHROMPLATTE,
  SCHUESSEL,
  KORB, 
  NONE
}
