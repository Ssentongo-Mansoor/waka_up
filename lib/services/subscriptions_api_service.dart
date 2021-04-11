import 'package:waka/models/subscriptionsmodel.dart';
import 'package:waka/providers/subscriptionsprovider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SubscritpionsApiService {
  // create static api endpoint
  static const String ALL_SUBSCRIPTIONS_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/subscriptions/subs.php";
  static const String SPECIFIC_USER_SUBSCRIPTION_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/subscriptions/subs.php";

  /* API Online
  static const String ALL_SUBSCRIPTIONS_API_ENDPOINT =
      "http://api.wakaug.com/v1.0/requests/subscriptions/subs.php";
  static const String SPECIFIC_USER_SUBSCRIPTION_API_ENDPOINT =
      "http://api.wakaug.com/v1.0/requests/subscriptions/subs.php";
  */

  // create function to fetch all hostels info
  static Future<List<Subscriptions>> getAllSubscriptions(
      List<Subscriptions> loadedAllSubscriptionsList,
      SubscriptionsProvider subscriptionsProvider) async {
    print("GET REQUEST to get all Subscriptions info");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.get(ALL_SUBSCRIPTIONS_API_ENDPOINT);
    } catch (e) {
      print("Error in get all payments API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("successful");
      try {
        loadedAllSubscriptionsList = subscriptionsFromJson(response.body);
        subscriptionsProvider.setSubscriptionsList(loadedAllSubscriptionsList);
      } catch (e) {
        print("Error: " + e.toString());
      }
    }
    return loadedAllSubscriptionsList;
  }

  // create function to fetch specific user subscriptions info
  static Future<List<Subscriptions>> getUserSpecificSubscriptions(
      List<Subscriptions> specificUserSubscriptionsList,
      SubscriptionsProvider subscriptionsProvider) async {
    print("POST REQUEST to get specific user subscriptions info");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _landLoadEmail = prefs.getString('email');
    // initialize room search parameters

    // assign values to the room search parameters
    print('Email ID: ' + _landLoadEmail);

    // set the data

    var data = {
      'email': _landLoadEmail,
    };
    print("POST REQUEST to get subscritpions according to parameters");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.post(SPECIFIC_USER_SUBSCRIPTION_API_ENDPOINT,
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: json.encode(data));
      print('Waiting for specific subscription API response.....');
    } catch (e) {
      print("Error in  specific user subscription API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("Successful API operation for specific subscriptions!");
      try {
        specificUserSubscriptionsList = subscriptionsFromJson(response.body);
        subscriptionsProvider
            .setSubscriptionsList(specificUserSubscriptionsList);
      } catch (e) {
        print("Error: " + e.toString());
      }
    }

    return specificUserSubscriptionsList;
  }
}
