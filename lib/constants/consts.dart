import 'package:flutter/material.dart';

// colors
const Color whitecolor = Colors.white;
const Color blackcolor = Colors.black;
const Color ambercolor = Colors.amber;

// page texts
const String welcome = "Welcome";
const String emailhint = "Email(ID)";
const String phonehint = "Registered phone(password)";
const String newpasswordhint = "New Password";
const String passwordhint = "Password";
const String confirmpasswordhint = "Confirm Password";
const String loginhint = "Login";
const String signuphint = "SignUp";
const String needsupport = "Need support ?";
const String cancel = "Cancel";
const String help = "help";
const String contnu = "continue";
const String subtxtreg =
    "In stillness find the tranquil stream,\nWhere thoughts dissolve,like morning dream.";
const String subtxtlogin = "In stillness find the tranquil stream,";
const String medicycle = "MeditationCycle";
const String home = "Home";
const String cycle = "Cycle : ";
const String day = "Day : ";

const String profile = "Profile";
const String username = "Username";
const String phone = "Phone";
const String email = "Email";
const String dob = "DOB";
const String pincode = "Pincode";
const String state = "State";
const String district = "District";
const String address = "Address";
const String idproof = "Id Proof Details";
const String meddatahed = "Meditation data";
const String meditationtimer = "Meditation\nTimer";
const String rewardnote = "Rewards and Notes";
const String appointment = "Appointment";



const List<String> hints = [
  "Aadhar No.",
  "IFSC Code",
  "Branch Name",
  "Bank Name",
  "Account Name",
  "Account No.",
  "Re-enter Account No."
];

//image paths
const String bgimage = "assets/images/bg.jpg";
const String logo = "assets/images/logo 4.png";
const String person = "assets/images/person.jpg";



// Size
// Size screenSize = WidgetsBinding.instance.window.physicalSize;
// double width = screenSize.width;
// double height = screenSize.height;



//Textstyles
const TextStyle welcomeheading = TextStyle(
  color: Colors.black,
  fontSize: 32.0,
  fontWeight: FontWeight.w600,
);
const TextStyle substyl = TextStyle(
  color: Colors.black,
  fontSize: 14.0,
);
const TextStyle headstyl = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);
const TextStyle timetheam = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontSize: 25.0,
);

const TextStyle timeStyl = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);

const TextStyle hometextw = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 10.0,
);

Decoration decor = BoxDecoration(
    color: blackcolor,
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.grey.shade800,
        Colors.black,
        Colors.black,
      ],
    ));
Decoration decorone = BoxDecoration(
    color: blackcolor,
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.grey.shade900,
        Colors.black,
        Colors.black,
        Colors.grey.shade900,
      ],
    ));
    
