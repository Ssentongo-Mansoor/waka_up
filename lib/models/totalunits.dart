// To parse this JSON data, do
//
//     final totalUnits = totalUnitsFromJson(jsonString);
import 'dart:convert';

TotalUnits totalUnitsFromJson(String str) =>
    TotalUnits.fromJson(json.decode(str));

String totalUnitsToJson(TotalUnits data) => json.encode(data.toJson());

class TotalUnits {
  TotalUnits({
    this.totalunits,
  });

  int totalunits;

  factory TotalUnits.fromJson(Map<String, dynamic> json) => TotalUnits(
        totalunits: json["totalunits"],
      );

  Map<String, dynamic> toJson() => {
        "totalunits": totalunits,
      };
}
