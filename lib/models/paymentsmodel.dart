// To parse this JSON data, do
//
//     final payments = paymentsFromJson(jsonString);

import 'dart:convert';

List<Payments> paymentsFromJson(String str) =>
    List<Payments>.from(json.decode(str).map((x) => Payments.fromJson(x)));

String paymentsToJson(List<Payments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payments {
  Payments({
    this.paymentId,
    this.tenantId,
    this.paymentFor,
    this.forPeriodOf,
    this.startDate,
    this.endDate,
    this.amount,
    this.balance,
    this.comment,
    this.refCode,
    this.buildingmanager,
  });

  String paymentId;
  String tenantId;
  String paymentFor;
  String forPeriodOf;
  DateTime startDate;
  DateTime endDate;
  String amount;
  String balance;
  String comment;
  String refCode;
  String buildingmanager;

  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        paymentId: json["payment_id"],
        tenantId: json["tenant_id"],
        paymentFor: json["payment_for"],
        forPeriodOf: json["for_period_of"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        amount: json["amount"],
        balance: json["balance"],
        comment: json["comment"],
        refCode: json["ref_code"],
        buildingmanager: json["buildingmanager"],
      );

  Map<String, dynamic> toJson() => {
        "payment_id": paymentId,
        "tenant_id": tenantId,
        "payment_for": paymentFor,
        "for_period_of": forPeriodOf,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "amount": amount,
        "balance": balance,
        "comment": comment,
        "ref_code": refCode,
        "buildingmanager": buildingmanager,
      };
}
