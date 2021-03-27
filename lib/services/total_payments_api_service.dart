import 'package:waka/models/total_payments_model.dart';
import 'package:waka/providers/total_payments_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TotalPaymentsApiService {
  // create static api endpoint
  static const String SPECIFIC_TOTAL_PAYMENTS_API_ENDPOINT =
      "http://192.168.43.254/waka/v1.0/requests/payment/total_payments.php";

  // create function to fetch specific tenants info
  static Future<TotalPayment> getTotalPayments(
      TotalPayment _totalPaymentsObject,
      TotalPaymentsProvider _totalPaymentsProvider) async {
    print("POST REQUEST to get total payments info");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _landLoadEmail = prefs.getString('email');
    print('Landlord Email: ' + _landLoadEmail);

    // set the data

    var data = {
      'email': _landLoadEmail,
    };
    print("POST REQUEST to get total payments according to parameters");
    // create a response variable
    var response;
    // wrap http post request in a try catch block
    try {
      response = await http.post(SPECIFIC_TOTAL_PAYMENTS_API_ENDPOINT,
          headers: {"Content-type": "application/json; charset=UTF-8"},
          body: json.encode(data));
      print('Waiting for total payments API response.....');
    } catch (e) {
      print("Error in  total payments API : " + e.toString());
    }
    // print response messages
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print("Successful API operation for specific total payments!");
      try {
        _totalPaymentsObject = totalPaymentFromJson(response.body);
        _totalPaymentsProvider.setTotalPaymentsModel(_totalPaymentsObject);
      } catch (e) {
        print("Error in Total Payments Service: " + e.toString());
      }
    }

    return _totalPaymentsObject;
  }
}
