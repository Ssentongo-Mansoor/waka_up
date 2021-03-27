// To parse this JSON data, do
//
//     final totalOccupiedRooms = totalOccupiedRoomsFromJson(jsonString);

import 'dart:convert';

TotalOccupiedRooms totalOccupiedRoomsFromJson(String str) =>
    TotalOccupiedRooms.fromJson(json.decode(str));

String totalOccupiedRoomsToJson(TotalOccupiedRooms data) =>
    json.encode(data.toJson());

class TotalOccupiedRooms {
  TotalOccupiedRooms({
    this.totaloccupiedrooms,
  });

  int totaloccupiedrooms;

  factory TotalOccupiedRooms.fromJson(Map<String, dynamic> json) =>
      TotalOccupiedRooms(
        totaloccupiedrooms: json["totaloccupiedrooms"],
      );

  Map<String, dynamic> toJson() => {
        "totaloccupiedrooms": totaloccupiedrooms,
      };
}
