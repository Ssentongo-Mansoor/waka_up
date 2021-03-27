import 'package:waka/models/subscriptionsmodel.dart';
import 'package:waka/providers/subscriptionsprovider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SubscritpionsApiService {
  // create static api endpoint
  static const String ALL_SUBSCRIPTIONS_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/subscriptions/subs.php";
  static const String SPECIFIC_USER_SUBSCRIPTION_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/subscriptions/subs.php";

  // create function to fetch all hostels info
  static Future<List<Subscriptions>> getAllSubscriptions(
      List<Subscriptions> loadedAllSubscriptionsList,
      SubscriptionsProvider subscriptionsProvider) async {
    print("GET REQUEST to get all Subscriptions info");
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
    // initialize room search parameters
    var _buildingManagerEmail;
    // assign values to the room search parameters
    // _buildingManagerEmail = subscriptionsProvider.getBuildingManagerEmail;
    _buildingManagerEmail = "buildingmanager@wakaug.com";
    print('Email ID: ' + _buildingManagerEmail);

    // set the data

    var data = {
      'email': _buildingManagerEmail,
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
