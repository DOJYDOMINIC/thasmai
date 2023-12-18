import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thasmai/pages/home.dart';
import '../controller/controller.dart';
import '../pages/otp.dart';
import '../widgets/dialogbox.dart';


const baseurl = "http://192.168.1.61:3000/api/";

String? code;

Future<void> sendOtp(

  String email,
  BuildContext context,
) async {
  const String url = "${baseurl}user/requestPasswordReset";
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  var provider = Provider.of<UserController>(context, listen: false);

    print("Sending OTP request...");

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode({"email":provider.email}),
    );
    print("Response status code: ${response.statusCode}");

    Map<String, dynamic> res = jsonDecode(response.body);

  try {
    if (response.statusCode == 200) {
      // API call successful
      provider.success = true;
      print("API call successful");
      provider.otp = res["otp"];
      print(provider.otp);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => OtpPage()));
    } else {
        // API call failed
        provider.success = false;
        print("API call failed");
        provider.responsemessage = res["message"];
        print(provider.responsemessage);
        showPlatformDialog(context, provider.responsemessage);
        // Explicitly return null in case of an error
        // return null;
      }

  } catch (e) {
    // Exception handling
    print("Error in sendOtp: $e");
    String text = "something went wrong";
    showPlatformDialog(context, text);
    // Show dialog or perform other error handling if needed
    // return null;
  }
}


// To verify otp backend
Future<void> VerifyOtp(
  Map<String, dynamic> data,
  BuildContext context,
) async {
  const String url = "${baseurl}user/resetPassword";
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  try {
    var provider = Provider.of<UserController>(context, listen: false);
    print("Sending OTP For verification...");
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(data),
    );


    Map<String, dynamic> res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // API call successful
      print(response.body.toString());
      // code = response.statusCode.toString();


      // return ;
    } else {
      // API call failed
      String text = res["message"];
      showPlatformDialog(context, text);
    }
  } catch (e) {
    // Exception handling
    print("Error in sendOtp: $e");
  }
}

// login api call
Future<void> loginCall(String email, String pass, BuildContext context) async {
  final apiUrl = '${baseurl}user/login'; // Replace with your actual API URL

  try {
    var provider = Provider.of<UserController>(context, listen: false);

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({
        'email':provider.email,
        'password': provider.password,
      }),
      headers: {'Content-Type': 'application/json'},
    );


    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      final String specificCookie = response.headers['set-cookie']?.split(';')[0] ?? "";
      final sessionId = specificCookie.split('=')[1];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('sessionId', sessionId);
      String? sessionKey = prefs.getString("sessionId");
      print(sessionKey);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));

      print('Login Successful: ${responseData}');

    } else {
      print('Login Failed: ${response.body}');
      String text = responseData["message"];
      showPlatformDialog(context, text);
    }
  } catch (e) {
    print('Error: $e');
  }
}
