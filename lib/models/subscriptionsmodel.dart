import 'dart:convert';

List<Subscriptions> subscriptionsFromJson(String str) =>
    List<Subscriptions>.from(
        json.decode(str).map((x) => Subscriptions.fromJson(x)));

String subscriptionsToJson(List<Subscriptions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subscriptions {
  Subscriptions({
    this.tenantid,
    this.roomid,
    this.refCode,
    this.paid,
    this.remaining,
    this.startdate,
    this.enddate,
    this.price,
    this.belongsto,
  });

  String tenantid;
  String roomid;
  String refCode;
  String paid;
  String remaining;
  String startdate;
  String enddate;
  String price;
  String belongsto;

  factory Subscriptions.fromJson(Map<String, dynamic> json) => Subscriptions(
        tenantid: json["tenantid"],
        roomid: json["roomid"],
        refCode: json["ref_code"],
        paid: json["paid"],
        remaining: json["remaining"],
        startdate: json["startdate"],
        enddate: json["enddate"],
        price: json["price"],
        belongsto: json["belongsto"],
      );

  Map<String, dynamic> toJson() => {
        "tenantid": tenantid,
        "roomid": roomid,
        "ref_code": refCode,
        "paid": paid,
        "remaining": remaining,
        "startdate": startdate,
        "enddate": enddate,
        "price": price,
        "belongsto": belongsto,
      };
}
