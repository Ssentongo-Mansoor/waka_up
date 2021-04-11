import 'package:waka/models/total_occupied_rooms.dart';
import 'package:waka/providers/occupied_rooms_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TotalOccupiedRoomsApiService {
  // create static api endpoint
  /*API Oflline
  static const String SPECIFIC_TOTAL_VACCANT_ROOMS_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/dashboard/units_occupied.php";
  */
  // API Online
  static const String SPECIFIC_TOTAL_OCCUPIED_ROOMS_API_ENDPOINT =
      "http://api.wakaug.com/v1.0/requests/dashboard/units_occupied.php";

  // create function to fetch specific tenants info
  static Future<TotalOccupiedRooms> getTotalOccupiedRooms(
      TotalOccupiedRooms totalOccupiedRoomsObject,
      TotalOccupiedRoomsProvider totalOccupiedRoomsProvider) async {
    print("POST REQUEST to get total info");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _landLoadEmail = prefs.getString('email');
    // initialize room search parameters
    print('Landloard Email: ' + _landLoadEmail);

    // set the data

    var data = {
      'email': _landLoadEmail,
    };
    print("POST REQUEST to get total occupiedrooms according to parameters");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.post(SPECIFIC_TOTAL_OCCUPIED_ROOMS_API_ENDPOINT,
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: json.encode(data));
      print('Waiting for total occupiedrooms API response.....');
    } catch (e) {
      print("Error in  total OccupiedRooms API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("Successful API operation for specific subscriptions!");
      try {
        totalOccupiedRoomsObject = totalOccupiedRoomsFromJson(response.body);
        totalOccupiedRoomsProvider
            .setTotalOccupiedRoomsObject(totalOccupiedRoomsObject);
      } catch (e) {
        print("Error in Total OccupiedRooms Service: " + e.toString());
      }
    }

    return totalOccupiedRoomsObject;
  }
}
