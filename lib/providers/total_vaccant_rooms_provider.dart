import 'package:flutter/material.dart';
import 'package:waka/models/total_vaccant_rooms.dart';
import 'package:waka/services/total_vaccant_rooms_api_service.dart';

class TotalVaccantRoomsProvider extends ChangeNotifier {
  int _totalvaccantrooms;
  TotalVaccantRooms _totalVaccantRoomsObject;
  // getters
  int get getTotalVaccantRooms => _totalvaccantrooms;
  TotalVaccantRooms get getTotalVaccantRoomsObject => _totalVaccantRoomsObject;
  TotalVaccantRoomsProvider() {
    print("TOTAL VACANTROOMS CONSTRUCTOR");
    getTotalVaccantRoomsObjectFromApi();
  }
  // setters
  void setTotalVaccantRooms(int totalVaccantRooms) {
    _totalvaccantrooms = totalVaccantRooms;
    notifyListeners();
  }

  void setTotalVaccantRoomsObject(TotalVaccantRooms totalVaccantRoomsObject) {
    _totalVaccantRoomsObject = totalVaccantRoomsObject;
    notifyListeners();
  }

  Future<void> getTotalVaccantRoomsObjectFromApi() async {
    try {
      await TotalVaccantRoomsApiService.getTotalVaccantRooms(
              _totalVaccantRoomsObject, this)
          .then((totalVaccantRoomsObject) {
        if (totalVaccantRoomsObject != null) {
          setTotalVaccantRoomsObject(totalVaccantRoomsObject);
        }
      });
    } catch (e) {
      print("Error in Total VaccantRooms Provider: " + e.toString());
    }
  }
}
