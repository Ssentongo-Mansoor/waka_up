import 'package:flutter/material.dart';
import 'package:waka/models/total_tenants.dart';
import 'package:waka/services/total_tenants_api_service.dart';

class TotalTenantsProvider extends ChangeNotifier {
  int _totaltenants;
  TotalTenants _totalTenantsObject;
  // getters
  int get getTotalTenants => _totaltenants;
  TotalTenants get getTotalTenantsObject => _totalTenantsObject;
  TotalTenantsProvider() {
    print("TOTAL TENANTS CONSTRUCTOR");
    getTotalTenantsObjectFromApi();
  }
  // setters
  void setTotalTenants(int totalTenants) {
    _totaltenants = totalTenants;
    notifyListeners();
  }

  void setTotalTenantsObject(TotalTenants totalTenantsObject) {
    _totalTenantsObject = totalTenantsObject;
    notifyListeners();
  }

  Future<void> getTotalTenantsObjectFromApi() async {
    try {
      await TotalTenantsApiService.getTotalTenants(_totalTenantsObject, this)
          .then((totalTenantsObject) {
        if (totalTenantsObject != null) {
          setTotalTenantsObject(totalTenantsObject);
        }
      });
    } catch (e) {
      print("Error in Total Tenants Provider: " + e.toString());
    }
  }
}
