/// @date 2020-07-05
/// @author HLQ_Struggle
/// @desc

// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);
// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    this.city,
    this.streets,
  });

  String city;
  List<String> streets;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        streets: List<String>.from(json["streets"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "streets": List<dynamic>.from(streets.map((x) => x)),
      };
}
