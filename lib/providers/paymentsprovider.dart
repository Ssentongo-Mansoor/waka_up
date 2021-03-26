import 'package:flutter/material.dart';
import 'package:waka/models/paymentsmodel.dart';
import 'package:waka/services/payments_api_service.dart';

class PaymentsProvider extends ChangeNotifier {
  String _paymentId;
  String _tenantId;
  String _paymentFor;
  String _forPeriodOf;
  String _startDate;
  String _endDate;
  String _amount;
  String _balance;
  String _comment;
  String _refCode;
  String _buildingmanager;
  Payments _individualPayment;
  List<Payments> _paymentsList = [];
  // constructor
  PaymentsProvider() {
    // getSpecificUserPaymentsInformation();
    try {
      PaymentsApiService.getUserSpecificPayments(getPaymentsList, this)
          .then((specificUserPaymentsList) {
        if (specificUserPaymentsList != null) {
          print(specificUserPaymentsList);
        }
      });
    } catch (e) {
      print("Error IN Payments Provider: " + e.toString());
    }
  }

  // getters
  String get getPaymentId => _paymentId;
  String get getTenantId => _tenantId;
  String get getPaymentFor => _paymentFor;
  String get getForPeriodOf => _forPeriodOf;
  String get getStartDate => _startDate;
  String get getEndDate => _endDate;
  String get getAmount => _amount;
  String get getBalance => _balance;
  String get getComment => _comment;
  String get getRefCode => _refCode;
  String get getBuildingManager => _buildingmanager;
  Payments get getIndividualPayment => _individualPayment;
  List<Payments> get getPaymentsList => _paymentsList;

  // setters
  void setPaymentId(String paymentId) {
    _paymentId = paymentId;
    notifyListeners();
  }

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
    notifyListeners();
  }

  void setPaymentFor(String paymentFor) {
    _paymentFor = paymentFor;
    notifyListeners();
  }

  void setForPeriodOf(String forPeriodOf) {
    _forPeriodOf = forPeriodOf;
    notifyListeners();
  }

  void setStarDate(String startDate) {
    _startDate = startDate;
    notifyListeners();
  }

  void setEndDate(String endDate) {
    _endDate = endDate;
    notifyListeners();
  }

  void setAmount(String amount) {
    _amount = amount;
    notifyListeners();
  }

  void setBalance(String balance) {
    _balance = balance;
    notifyListeners();
  }

  void setComment(String comment) {
    _comment = comment;
    notifyListeners();
  }

  void setRefCode(String refCode) {
    _refCode = refCode;
    notifyListeners();
  }

  void setBuildingManager(String buildingManager) {
    _buildingmanager = buildingManager;
    notifyListeners();
  }

  void setIndividualPayment(Payments individualPayment) {
    _individualPayment = individualPayment;
    notifyListeners();
  }

  void setPaymentsList(List<Payments> paymentsList) {
    _paymentsList = paymentsList;
    notifyListeners();
  }

  Future<void> getSpecificUserPaymentsInformation() async {
    try {
      await PaymentsApiService.getUserSpecificPayments(getPaymentsList, this)
          .then((specificUserPaymentsList) {
        if (specificUserPaymentsList != null) {
          setPaymentsList(specificUserPaymentsList);
        }
      });
    } catch (e) {
      print("Error IN Payments Provider: " + e.toString());
    }
  }
}
