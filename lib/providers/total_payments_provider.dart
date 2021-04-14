import 'package:flutter/material.dart';
import 'package:waka/models/total_payments_model.dart';
import 'package:waka/services/total_payments_api_service.dart';

class TotalPaymentsProvider extends ChangeNotifier {
  String _totalPayments;
  TotalPayment _totalPaymentsModel;
  // constructor
  TotalPaymentsProvider() {
    print("TOTAL PAYMENTS PROVIDER CONSTRUCTOR");
    // getTotalPaymentsModelFromApi();
  }
  // getters
  String get getTotalPayments => _totalPayments;
  TotalPayment get getTotalPaymentsModel => _totalPaymentsModel;
  // setters
  void setTotalPayments(String totalPayments) {
    _totalPayments = totalPayments;
    notifyListeners();
  }

  void setTotalPaymentsModel(TotalPayment totalPaymentsModel) {
    _totalPaymentsModel = totalPaymentsModel;
    notifyListeners();
  }

  Future<TotalPayment> getTotalPaymentsInfo() async {
    try {
      return await TotalPaymentsApiService.getTotalPayments(
          _totalPaymentsModel, this);
    } catch (e) {
      print("Error in the Future : " + e.toString());
    }
  }
}
