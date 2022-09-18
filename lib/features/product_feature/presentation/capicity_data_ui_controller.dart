import '../domain/entities/product_capicity.dart';

class CapicityList {
  final List<ProductCapicity> _list = [];
  CapicityList();
  List<ProductCapicity> get capicities => _list;

  factory CapicityList.fromListOfProducts(List<ProductCapicity> capicites) {
    CapicityList capicityList = CapicityList();

    capicites.forEach(
      (element) => capicityList.addCapicity(element),
    );

    return capicityList;
  }

  void addCapicity(ProductCapicity newCapicity) {
    if (_list.any((element) => element.packung == newCapicity.packung)) {
      var existedCapicity =
          _list.firstWhere((element) => element.packung == newCapicity.packung);
      // if the Topf Name already in the List

      existedCapicity.minPax = getSmallestValue(
          newValue: newCapicity.minPax, oldvalue: existedCapicity.minPax);

      existedCapicity.maxPax = getHighestValue(
          newValue: newCapicity.maxPax, oldvalue: existedCapicity.maxPax);
      _list[_list.indexOf(existedCapicity)] = existedCapicity;
      // i should check of Min and Max Pax

    } else if (_list.any((existedCapicity) {
      return existedCapicity.minPax <= newCapicity.minPax &&
          existedCapicity.maxPax >= newCapicity.minPax;
    })) {
      // do something
      print('invalid minpax');
    } else if (_list.any((existedCapicity) {
      return existedCapicity.minPax >= newCapicity.maxPax &&
          existedCapicity.maxPax <= newCapicity.maxPax;
    })) {
      // do something
      print('invalid maxpax');
    } else {
      _list.add(newCapicity);
    }
  }

  int getHighestValue({required int newValue, required int oldvalue}) {
    if (newValue > oldvalue) {
      return newValue;
    } else {
      return oldvalue;
    }
  }

  int getSmallestValue({required int newValue, required int oldvalue}) {
    if (newValue > oldvalue) {
      return oldvalue;
    } else {
      return newValue;
    }
  }

  void removeItem(ProductCapicity productCapicity) {
    _list.remove(productCapicity);
  }

  void removeItembyIndex(int index) {
    _list.removeAt(index);
  }
}
