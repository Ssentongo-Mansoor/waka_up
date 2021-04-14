import 'package:flutter/material.dart';
import 'package:waka/models/roomsmodel.dart';
import 'package:waka/services/rooms_api_service.dart';

class RoomsProvider extends ChangeNotifier {
  String roomId;
  String roomName;
  String type;
  String features;
  String rent;
  String status;
  String belongsto;
  Room _singleRoom;
  List<Room> _roomsList = [];
  // getters
  Room get getSingleRoom => _singleRoom;
  List<Room> get getRoomList => _roomsList;
  // setters
  void setSingleRoom(Room singleRoom) {
    _singleRoom = singleRoom;
    notifyListeners();
  }

  void setRoomsList(List<Room> roomsList) {
    _roomsList = roomsList;
    notifyListeners();
  }

  Future<List<Room>> getRoomsListInfo() async {
    try {
      return await RoomsApiService.getSpecificRooms(_roomsList, this);
    } catch (e) {
      print("Error in Rooms List Future: " + e.toString());
    }
  }
}
