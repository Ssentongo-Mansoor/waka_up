import 'package:flutter/cupertino.dart';
import 'package:waka/models/totalunits.dart';
import 'package:waka/providers/totalunitsprovider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TotalUnitsApiService {
  // create static api endpoint
  static const String SPECIFIC_TOTAL_UNITS_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/dashboard/units_total.php";
  /* Online API
  static const String SPECIFIC_TOTAL_UNITS_API_ENDPOINT =
      "http://api.wakaug.com/v1.0/requests/dashboard/units_total.php";
    */
  // create function to fetch specific tenants info
  static Future<TotalUnits> getTotalUnits(TotalUnits totalUnitsObject,
      TotalUnitsProvider totalUnitsProvider) async {
    print("POST REQUEST to get total info");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _landLoadEmail = prefs.getString('email');

    print('Landlord Email: ' + _landLoadEmail);

    // set the data

    var data = {
      'email': _landLoadEmail,
    };
    print("POST REQUEST to get total units according to parameters");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.post(SPECIFIC_TOTAL_UNITS_API_ENDPOINT,
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: json.encode(data));
      print('Waiting for total units API response.....');
    } catch (e) {
      print("Error in  total Units API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("Successful API operation for specific subscriptions!");
      try {
        totalUnitsObject = totalUnitsFromJson(response.body);
        totalUnitsProvider.setTotalUnitsObject(totalUnitsObject);
      } catch (e) {
        print("Error in Total Units Service: " + e.toString());
      }
    }

    return totalUnitsObject;
  }
}
