import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thasmai/constants/consts.dart';
import 'package:thasmai/controller/controller.dart';
import 'package:thasmai/pages/login.dart';
import 'package:thasmai/widgets/dialogbox.dart';
import 'package:thasmai/widgets/main_fields.dart';
import '../models/otpmodel.dart';
import '../services/services.dart';
import 'otp.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();

    // Subscribe to connectivity changes
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _connectivityResult = result;
      });
    });

    // Check initial connectivity
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = connectivityResult;
    });
    if (_connectivityResult == ConnectivityResult.none) {
      var text = "No internet";
      return showPlatformDialog(context, text);
    }
  }

  double val = 0.18;

  String _email = '';
  String _phone = '';
  String _password = '';

  bool isPressed = false;

  void ButtonState() {
    setState(() {
      isPressed = !isPressed;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        isPressed = !isPressed;
      });
    });
  }

  final _formKey = GlobalKey<FormState>();

  // Remove these controllers if not needed
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<UserController>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Container(
                decoration: const BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(bgimage),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(
                              builder: (BuildContext context) {
                                return IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: const Icon(Icons.menu,
                                      color: Colors.black, size: 35),
                                );
                              },
                            ),
                            SizedBox(
                                width: 45,
                                height: 45,
                                child: Image.asset(logo)),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                child: Text(welcome, style: welcomeheading)),
                          ],
                        ),
                        Row(
                          children: [
                            Container(child: Text(subtxtreg, style: substyl)),
                          ],
                        ),
                        SizedBox(height: height * val),
                        TextFieldOne(
                          hintText: emailhint,
                          // Use controllers if needed
                          controller: email,
                          onchange: (value) {
                            provider.email= value;
                          },
                          obsecuretxt: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        TextFieldOne(
                          hintText: phonehint,
                          // Use controllers if needed
                          controller: phone,
                          onchange: (value) {
                            provider.phone = value;
                          },
                          obsecuretxt: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                              return 'Please enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                        TextFieldOne(
                          hintText: newpasswordhint,
                          // Use controllers if needed
                          controller: password,
                          onchange: (value) {
                            provider.password = value;
                          },
                          obsecuretxt: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        TextFieldOne(
                          hintText: confirmpasswordhint,
                          // Use controllers if needed
                          controller: confirmpass,
                          onchange: (value) {},
                          obsecuretxt: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != provider.password) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * .04),
                        GestureDetector(
                          onTap: () async {
                            print("enter0");
                            setState(() {
                              ButtonState();
                            });
                            if (_formKey.currentState!.validate()) {
                              print("enter");
                              Otp? otpResponse = await sendOtp(_email, context);
                              if (otpResponse!.otp.isNotEmpty) {
                                print("enter1");

                                String otp = otpResponse.otp.toString();

                                var data = <String, dynamic>{
                                  "email": _email,
                                  "phone": _phone,
                                  "password": _password,
                                  "otp": otp,
                                };
                                setState(() {});
                                print("data : $otp");

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtpPage(
                                              data: data,
                                            )));
                              } else {
                                print("enter2");

                                var text = "reg issue";
                                showPlatformDialog(context, text);
                              }
                              print(otpResponse.otp.toString());
                              return null;
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 50),
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: isPressed
                                  ? LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.grey.shade400,
                                        Colors.grey.shade200,
                                        Colors.white
                                      ],
                                    )
                                  : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Colors.grey.shade200,
                                        Colors.grey.shade400
                                      ],
                                    ),
                              boxShadow: isPressed
                                  ? [
                                      const BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                      ),
                                    ]
                                  : [
                                      const BoxShadow(
                                        color: Colors.transparent,
                                      ),
                                    ],
                            ),
                            child: const Center(
                              child: Text(
                                signuphint,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * .06),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              },
                              child: const Text(
                                loginhint,
                                style: TextStyle(color: ambercolor),
                              ),
                            ),
                            Text(needsupport,
                                style: TextStyle(color: whitecolor)),
                            TextButton(
                              onPressed: () {},
                              child: const Text(help,
                                  style: TextStyle(color: ambercolor)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
