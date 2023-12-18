import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter/foundation.dart';

class UserController extends ChangeNotifier {
  String _email = '';
  String _phone = '';
  String _password = '';
  String _confirmPassword = '';
  String _otp = '';
  String _responsemessage = '';
  bool _success = false;



  // Getter and setter for email
  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  // Getter and setter for phone
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  // Getter and setter for password
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  // Getter and setter for confirmPassword
  String get confirmPassword => _confirmPassword;
  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  String get otp => _otp;
  set otp(String value) {
    _password = value;
    notifyListeners();
  }


    bool get success => _success;
    set success(bool value) {
      _success = value;
      notifyListeners();
    }


    String get responsemessage => _responsemessage;
    set responsemessage(String value) {
      _responsemessage = value;
      notifyListeners();
    }

  }
