import 'package:flutter/foundation.dart';

class TableDataList {
  List<dynamic> allData = [];

  List<dynamic> filteredData = [];

  addMoreData({required List<dynamic> listOfData}) {
    for (var element in listOfData) {
      if (allData.contains(element) == false) {
        allData.add(element);

        
      }
    }
  }


}
