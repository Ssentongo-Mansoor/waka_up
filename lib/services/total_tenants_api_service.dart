import 'package:flutter/cupertino.dart';
import 'package:waka/models/total_tenants.dart';
import 'package:waka/providers/total_tenants_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TotalTenantsApiService {
  // create static api endpoint
  static const String SPECIFIC_TOTAL_TENANTS_API_ENDPOINT =
      "http://192.168.43.208/waka/v1.0/requests/dashboard/tenants_total.php";

  // create function to fetch specific tenants info
  static Future<TotalTenants> getTotalTenants(TotalTenants totalTenantsObject,
      TotalTenantsProvider totalTenantsProvider) async {
    print("POST REQUEST to get total info");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    // initialize room search parameters
    var _buildingManagerEmail;
    // assign values to the room search parameters
    // _buildingManagerEmail = email;
    _buildingManagerEmail = 'buildingmanager@wakaug.com';
    print('Email ID: ' + _buildingManagerEmail);

    // set the data

    var data = {
      'email': _buildingManagerEmail,
    };
    print("POST REQUEST to get total tenants according to parameters");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.post(SPECIFIC_TOTAL_TENANTS_API_ENDPOINT,
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: json.encode(data));
      print('Waiting for total tenants API response.....');
    } catch (e) {
      print("Error in  total Tenants API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("Successful API operation for specific subscriptions!");
      try {
        totalTenantsObject = totalTenantsFromJson(response.body);
        totalTenantsProvider.setTotalTenantsObject(totalTenantsObject);
      } catch (e) {
        print("Error in Total Tenants Service: " + e.toString());
      }
    }

    return totalTenantsObject;
  }
}
