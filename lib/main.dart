import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thasmai/pages/login.dart';
import 'package:thasmai/pages/meditationtimer.dart';
import 'package:thasmai/pages/player.dart';
import 'package:thasmai/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.black,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        ),
        home: TimerScreen());
        // home: Login());
  }
}
