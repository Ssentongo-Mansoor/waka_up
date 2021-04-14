import 'dart:convert';

TotalVaccantRooms totalVaccantRoomsFromJson(String str) =>
    TotalVaccantRooms.fromJson(json.decode(str));

String totalVaccantRoomsToJson(TotalVaccantRooms data) =>
    json.encode(data.toJson());

class TotalVaccantRooms {
  TotalVaccantRooms({
    this.totalvaccantrooms,
  });

  int totalvaccantrooms;

  factory TotalVaccantRooms.fromJson(Map<String, dynamic> json) =>
      TotalVaccantRooms(
        totalvaccantrooms: json["totalvaccantrooms"],
      );

  Map<String, dynamic> toJson() => {
        "totalvaccantrooms": totalvaccantrooms,
      };
}
