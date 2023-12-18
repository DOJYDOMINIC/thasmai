// To parse this JSON data, do
//
//     final otp = otpFromJson(jsonString);

import 'dart:convert';

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

class Otp {
  String message;
  String otp;

  Otp({
    required this.message,
    required this.otp,
  });

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        message: json["message"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "otp": otp,
      };
}
