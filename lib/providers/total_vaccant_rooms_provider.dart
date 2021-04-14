import 'package:flutter/material.dart';
import 'package:waka/models/total_vaccant_rooms.dart';
import 'package:waka/services/total_vaccant_rooms_api_service.dart';

class TotalVaccantRoomsProvider extends ChangeNotifier {
  int _totalvaccantrooms;
  TotalVaccantRooms _totalVaccantRoomsObject;
  // getters
  int get getTotalVaccantRooms => _totalvaccantrooms;
  TotalVaccantRooms get getTotalVaccantRoomsObject => _totalVaccantRoomsObject;

  // setters
  void setTotalVaccantRooms(int totalVaccantRooms) {
    _totalvaccantrooms = totalVaccantRooms;
    notifyListeners();
  }

  void setTotalVaccantRoomsObject(TotalVaccantRooms totalVaccantRoomsObject) {
    _totalVaccantRoomsObject = totalVaccantRoomsObject;
    notifyListeners();
  }

  Future<TotalVaccantRooms> getTotalVaccantRoomsInfo() async {
    try {
      return await TotalVaccantRoomsApiService.getTotalVaccantRooms(
          _totalVaccantRoomsObject, this);
    } catch (e) {
      print("Error in Total Vaccant Rooms Future : " + e.toString());
    }
  }
}
