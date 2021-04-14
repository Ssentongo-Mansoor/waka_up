import 'package:flutter/material.dart';
import 'package:waka/models/total_occupied_rooms.dart';
import 'package:waka/services/total_occupied_rooms_api_service.dart';

class TotalOccupiedRoomsProvider extends ChangeNotifier {
  int _totaloccupiedrooms;
  TotalOccupiedRooms _totalOccupiedRoomsObject;
  // getters
  int get getTotalOccupiedRooms => _totaloccupiedrooms;
  TotalOccupiedRooms get getTotalOccupiedRoomsObject =>
      _totalOccupiedRoomsObject;
  TotalOccupiedRoomsProvider() {
    print("TOTAL OCCUPIEDROOMS CONSTRUCTOR");
    //  getTotalOccupiedRoomsObjectFromApi();
  }
  // setters
  void setTotalOccupiedRooms(int totalOccupiedRooms) {
    _totaloccupiedrooms = totalOccupiedRooms;
    notifyListeners();
  }

  void setTotalOccupiedRoomsObject(
      TotalOccupiedRooms totalOccupiedRoomsObject) {
    _totalOccupiedRoomsObject = totalOccupiedRoomsObject;
    notifyListeners();
  }

  Future<TotalOccupiedRooms> getTotalOccupiedRoomsInfo() async {
    try {
      return await TotalOccupiedRoomsApiService.getTotalOccupiedRooms(
          _totalOccupiedRoomsObject, this);
    } catch (e) {
      print("Error in Future: " + e.toString());
    }
  }
}
