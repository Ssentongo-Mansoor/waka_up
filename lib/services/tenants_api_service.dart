import 'package:flutter/cupertino.dart';
import 'package:waka/models/tenantsmodel.dart';
import 'package:waka/providers/tenantsprovider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TenantsApiService {
  // create static api endpoint
  static const String SPECIFIC_TENANTS_API_ENDPOINT =
      "http://192.168.43.208/waka/v1.0/requests/tenants/tenants.php";

  // create function to fetch specific tenants info
  static Future<List<Tenant>> getSpecificTenants(
      List<Tenant> specificTenantsList, TenantsProvider tenantsProvider) async {
    print("POST REQUEST to get specific tenants info");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    // initialize room search parameters
    var _buildingManagerEmail;
    // assign values to the room search parameters
    _buildingManagerEmail = email;

    print('Email ID: ' + _buildingManagerEmail);

    // set the data

    var data = {
      'email': _buildingManagerEmail,
    };
    print("POST REQUEST to get tenants according to parameters");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.post(SPECIFIC_TENANTS_API_ENDPOINT,
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: json.encode(data));
      print('Waiting for specific tenants API response.....');
    } catch (e) {
      print("Error in  specific tenants API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("Successful API operation for specific subscriptions!");
      try {
        specificTenantsList = tenantFromJson(response.body);
        tenantsProvider.setTenantsList(specificTenantsList);
      } catch (e) {
        print("Error: " + e.toString());
      }
    }

    return specificTenantsList;
  }
}
