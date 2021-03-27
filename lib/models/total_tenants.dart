// To parse this JSON data, do
//
//     final totalTenants = totalTenantsFromJson(jsonString);

import 'dart:convert';

TotalTenants totalTenantsFromJson(String str) =>
    TotalTenants.fromJson(json.decode(str));

String totalTenantsToJson(TotalTenants data) => json.encode(data.toJson());

class TotalTenants {
  TotalTenants({
    this.totaltenants,
  });

  int totaltenants;

  factory TotalTenants.fromJson(Map<String, dynamic> json) => TotalTenants(
        totaltenants: json["totaltenants"],
      );

  Map<String, dynamic> toJson() => {
        "totaltenants": totaltenants,
      };
}
