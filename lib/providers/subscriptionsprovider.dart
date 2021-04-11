import 'package:flutter/material.dart';
import 'package:waka/models/subscriptionsmodel.dart';
import 'package:waka/services/subscriptions_api_service.dart';

class SubscriptionsProvider extends ChangeNotifier {
  String _tenantId;
  String _roomId;
  String _refCode;
  String _paid;
  String _remaining;
  String _startdate;
  String _enddate;
  String _price;
  String _belongsto;
  String _buildingManagerEmail;
  Subscriptions _individualSubscription;
  List<Subscriptions> _subscriptionsList = [];
  // constructor
  SubscriptionsProvider() {
    print("SUBSCRIPTIONS CONSTRUCTOR");

    // getSpecificUserSubscriptionsInformation();
  }

  // getters
  String get getTenantId => _tenantId;
  String get getRoomId => _roomId;
  String get getRefCode => _refCode;
  String get getPaid => _paid;
  String get getRemaining => _remaining;
  String get getStartDate => _startdate;
  String get getEndDate => _enddate;
  String get getPrice => _price;
  String get getBelongsTo => _belongsto;
  String get getBuildingManagerEmail => _buildingManagerEmail;
  Subscriptions get getIndividualSubscription => _individualSubscription;
  List<Subscriptions> get getSubscriptionsList => _subscriptionsList;

  // setters
  void setTenantId(String tenantId) {
    _tenantId = tenantId;
    notifyListeners();
  }

  void setRoomId(String roomId) {
    _roomId = roomId;
    notifyListeners();
  }

  void setRefCode(String refCode) {
    _refCode = refCode;
    notifyListeners();
  }

  void setPaid(String paid) {
    _paid = paid;
    notifyListeners();
  }

  void setRemaining(String remaining) {
    _remaining = remaining;
    notifyListeners();
  }

  void setStartDate(String startDate) {
    _startdate = startDate;
    notifyListeners();
  }

  void setEndDate(String endDate) {
    _enddate = endDate;
    notifyListeners();
  }

  void setPrice(String price) {
    _price = price;
    notifyListeners();
  }

  void setBuildingManagerEmail(String buildingManagerEmail) {
    _buildingManagerEmail = buildingManagerEmail;
    notifyListeners();
  }

  void setIndividualSubscription(Subscriptions individualSubscription) {
    _individualSubscription = individualSubscription;
    notifyListeners();
  }

  void setSubscriptionsList(List<Subscriptions> subscriptionsList) {
    _subscriptionsList = subscriptionsList;
    notifyListeners();
  }

  Future<void> getSpecificUserSubscriptionsInformation() async {
    try {
      await SubscritpionsApiService.getUserSpecificSubscriptions(
              _subscriptionsList, this)
          .then((specificUserSubscriptionsList) {
        if (specificUserSubscriptionsList != null) {
          setSubscriptionsList(specificUserSubscriptionsList);
        }
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }
}
