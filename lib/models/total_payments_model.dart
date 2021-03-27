// To parse this JSON data, do
//
//     final totalPayment = totalPaymentFromJson(jsonString);

import 'dart:convert';

TotalPayment totalPaymentFromJson(String str) =>
    TotalPayment.fromJson(json.decode(str));

String totalPaymentToJson(TotalPayment data) => json.encode(data.toJson());

class TotalPayment {
  TotalPayment({
    this.totalPayments,
  });

  String totalPayments;

  factory TotalPayment.fromJson(Map<String, dynamic> json) => TotalPayment(
        totalPayments: json["total_payments"],
      );

  Map<String, dynamic> toJson() => {
        "total_payments": totalPayments,
      };
}
