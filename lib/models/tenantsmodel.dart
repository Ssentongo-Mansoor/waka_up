// To parse this JSON data, do
//
//     final tenant = tenantFromJson(jsonString);

import 'dart:convert';

List<Tenant> tenantFromJson(String str) =>
    List<Tenant>.from(json.decode(str).map((x) => Tenant.fromJson(x)));

String tenantToJson(List<Tenant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tenant {
  Tenant({
    this.tenantid,
    this.firstName,
    this.lastName,
    this.otherName,
    this.gender,
    this.nationalIdNumber,
    this.otherIdentification,
    this.emailAddress,
    this.phoneNumber,
    this.registrationDate,
    this.roomId,
    this.agreementDocument,
    this.passportPhoto,
    this.occupation,
    this.companyName,
    this.addedby,
  });

  String tenantid;
  String firstName;
  String lastName;
  String otherName;
  String gender;
  String nationalIdNumber;
  String otherIdentification;
  String emailAddress;
  String phoneNumber;
  String registrationDate;
  String roomId;
  String agreementDocument;
  String passportPhoto;
  String occupation;
  String companyName;
  String addedby;

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        tenantid: json["tenantid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        otherName: json["other_name"],
        gender: json["gender"],
        nationalIdNumber: json["national_id_number"],
        otherIdentification: json["other_identification"],
        emailAddress: json["email_address"],
        phoneNumber: json["phone_number"],
        registrationDate: json["registration_date"],
        roomId: json["room_id"],
        agreementDocument: json["agreement_document"],
        passportPhoto: json["passport_photo"],
        occupation: json["occupation"],
        companyName: json["company_name"],
        addedby: json["addedby"],
      );

  Map<String, dynamic> toJson() => {
        "tenantid": tenantid,
        "first_name": firstName,
        "last_name": lastName,
        "other_name": otherName,
        "gender": gender,
        "national_id_number": nationalIdNumber,
        "other_identification": otherIdentification,
        "email_address": emailAddress,
        "phone_number": phoneNumber,
        "registration_date": registrationDate,
        "room_id": roomId,
        "agreement_document": agreementDocument,
        "passport_photo": passportPhoto,
        "occupation": occupation,
        "company_name": companyName,
        "addedby": addedby,
      };
}
