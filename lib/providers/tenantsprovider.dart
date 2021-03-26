import 'package:flutter/material.dart';
import 'package:waka/models/tenantsmodel.dart';
import 'package:waka/services/tenants_api_service.dart';

class TenantsProvider extends ChangeNotifier {
  String _tenantid;
  String _firstName;
  String _lastName;
  String _otherName;
  String _gender;
  String _nationalIdNumber;
  String _otherIdentification;
  String _emailAddress;
  String _phoneNumber;
  String _registrationDate;
  String _roomId;
  String _agreementDocument;
  String _passportPhoto;
  String _occupation;
  String _companyName;
  String _addedby;
  Tenant _singleTenant;
  List<Tenant> _tenantsList = [];
  // getters
  Tenant get getSingleTenant => _singleTenant;
  List<Tenant> get getTenantList => _tenantsList;
  // setters
  void setSingleTenant(Tenant singleTenant) {
    _singleTenant = singleTenant;
    notifyListeners();
  }

  void setTenantsList(List<Tenant> tenantsList) {
    _tenantsList = tenantsList;
    notifyListeners();
  }

  Future<void> getSpecificTenantsList() async {
    try {
      await TenantsApiService.getSpecificTenants(_tenantsList, this)
          .then((specificTenantsList) {
        if (specificTenantsList != null) {
          setTenantsList(specificTenantsList);
        }
      });
    } catch (e) {
      print("Tenants getSpecificTenantsList() error: " + e.toString());
    }
  }
}
