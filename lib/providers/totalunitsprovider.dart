import 'package:flutter/material.dart';
import 'package:waka/models/totalunits.dart';
import 'package:waka/services/total_units_api_service.dart';

class TotalUnitsProvider extends ChangeNotifier {
  int _totalunits;
  TotalUnits _totalUnitsObject;
  // getters
  int get getTotalUnits => _totalunits;
  TotalUnits get getTotalUnitsObject => _totalUnitsObject;

  // setters
  void setTotalUnits(int totalUnits) {
    _totalunits = totalUnits;
    notifyListeners();
  }

  void setTotalUnitsObject(TotalUnits totalUnitsObject) {
    _totalUnitsObject = totalUnitsObject;
    notifyListeners();
  }

  Future<TotalUnits> getTotalUnitsInfo() async {
    try {
      return await TotalUnitsApiService.getTotalUnits(_totalUnitsObject, this);
    } catch (e) {
      print('Total Units Future error: ' + e.toString());
    }
  }
}
