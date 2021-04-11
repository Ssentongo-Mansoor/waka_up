import 'package:flutter/cupertino.dart';
import 'package:waka/models/roomsmodel.dart';
import 'package:waka/providers/roomsprovider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RoomsApiService {
  // create static api endpoint
  static const String SPECIFIC_ROOMS_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/rooms/rooms.php";

  /*online Api 
  static const String SPECIFIC_ROOMS_API_ENDPOINT =
      "http://api.wakaug.com/v1.0/requests/rooms/rooms.php";
  */

  // create function to fetch specific tenants info
  static Future<List<Room>> getSpecificRooms(
      List<Room> specificRoomsList, RoomsProvider roomsProvider) async {
    print("POST REQUEST to get specific rooms info");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _landLoadEmail = prefs.getString('email');
    // assign values to the room search parameters
    print('Landloard Email: ' + _landLoadEmail);
    // set the data
    var data = {
      'email': _landLoadEmail,
    };
    print("POST REQUEST to get roomss according to parameters");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.post(SPECIFIC_ROOMS_API_ENDPOINT,
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
        specificRoomsList = roomFromJson(response.body);
        roomsProvider.setRoomsList(specificRoomsList);
      } catch (e) {
        print("Error: " + e.toString());
      }
    }
    return specificRoomsList;
  }
}
