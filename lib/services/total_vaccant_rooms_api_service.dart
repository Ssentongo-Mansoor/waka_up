import 'package:waka/models/total_vaccant_rooms.dart';
import 'package:waka/providers/total_vaccant_rooms_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TotalVaccantRoomsApiService {
  // create static api endpoint
  static const String SPECIFIC_TOTAL_UNITS_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/dashboard/units_vacant.php";
  /* API Online
  static const String SPECIFIC_TOTAL_UNITS_API_ENDPOINT =
      "http://api.wakaug.com/v1.0/requests/dashboard/units_vacant.php";
  */
  // create function to fetch specific tenants info
  static Future<TotalVaccantRooms> getTotalVaccantRooms(
      TotalVaccantRooms totalVaccantRoomsObject,
      TotalVaccantRoomsProvider totalVaccantRoomsProvider) async {
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
      print("Error in  total VaccantRooms API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("Successful API operation for specific subscriptions!");
      try {
        totalVaccantRoomsObject = totalVaccantRoomsFromJson(response.body);
        totalVaccantRoomsProvider
            .setTotalVaccantRoomsObject(totalVaccantRoomsObject);
      } catch (e) {
        print("Error in Total VaccantRooms Service: " + e.toString());
      }
    }

    return totalVaccantRoomsObject;
  }
}
