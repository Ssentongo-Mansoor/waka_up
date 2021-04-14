import 'package:waka/models/paymentsmodel.dart';
import 'package:waka/providers/paymentsprovider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentsApiService {
  // create static api endpoint
  //From API Online
  static const String ALL_PAYMENTS_API_ENDPOINT =
      "http://api.wakaug.com/v1.0/requests/payment/payments.php";
  static const String SPECIFIC_USER_PAYMENTS_API_ENDPOINT =
      "http://api.wakaug.com/v1.0/requests/payment/payments.php";

  // create function to fetch all hostels info
  static Future<List<Payments>> getAllPayments(
      List<Payments> loadedAllPaymentsList,
      PaymentsProvider paymentsProvider) async {
    print("GET REQUEST to get all Payments info");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.get(ALL_PAYMENTS_API_ENDPOINT);
    } catch (e) {
      print("Error in get all payments API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("successful");
      try {
        loadedAllPaymentsList = paymentsFromJson(response.body);
        paymentsProvider.setPaymentsList(loadedAllPaymentsList);
      } catch (e) {
        print("Error: " + e.toString());
      }
    }
    return loadedAllPaymentsList;
  }

  // create function to fetch nearby hostels info
  static Future<List<Payments>> getUserSpecificPayments(
      List<Payments> specificUserPaymentsList,
      PaymentsProvider paymentsProvider) async {
    print("POST REQUEST to get specific user payments info");
    // initialize room search parameters
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _landLoadEmail = prefs.getString('email');

    print('Landloard Email: ' + _landLoadEmail);

    // set the data

    var data = {
      'email': _landLoadEmail,
    };
    print("POST REQUEST to get payments according to parameters");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.post(SPECIFIC_USER_PAYMENTS_API_ENDPOINT,
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: json.encode(data));
      print('Waiting for specific payment API response.....');
    } catch (e) {
      print("Error in  specific user payment API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("Successful API operation for specific payments!");
      try {
        specificUserPaymentsList = paymentsFromJson(response.body);
        paymentsProvider.setPaymentsList(specificUserPaymentsList);
      } catch (e) {
        print("Error Payments API: " + e.toString());
      }
    }

    return specificUserPaymentsList;
  }
}
