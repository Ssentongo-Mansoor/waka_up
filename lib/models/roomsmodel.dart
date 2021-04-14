import 'dart:convert';

List<Room> roomFromJson(String str) =>
    List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));

String roomToJson(List<Room> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Room {
  Room({
    this.roomId,
    this.roomName,
    this.type,
    this.features,
    this.rent,
    this.status,
    this.belongsto,
  });

  String roomId;
  String roomName;
  String type;
  String features;
  String rent;
  String status;
  String belongsto;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json["room_id"],
        roomName: json["room_name"],
        type: json["type"],
        features: json["features"],
        rent: json["rent"],
        status: json["status"],
        belongsto: json["belongsto"],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "room_name": roomName,
        "type": type,
        "features": features,
        "rent": rent,
        "status": status,
        "belongsto": belongsto,
      };
}
