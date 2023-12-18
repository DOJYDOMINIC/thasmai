import 'package:flutter/material.dart';
import 'package:thasmai/constants/consts.dart';
import 'package:thasmai/pages/register.dart';
import 'package:thasmai/services/services.dart';
import 'package:thasmai/widgets/main_fields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isPressed = false;

  void buttonState() {
    setState(() {
      isPressed = !isPressed;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        isPressed = !isPressed;
      });
    });
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          // width: 300,
          height: height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(bgimage))),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
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
                      SizedBox(width: 45, height: 45, child: Image.asset(logo))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(loginhint, style: welcomeheading),
                            ],
                          ),
                          Container(child: Text(subtxtreg, style: substyl)),
                          SizedBox(
                            height: height * .25,
                          ),
                          TextFieldOne(
                            hinttext: emailhint,
                            controller: email,
                            onchange: (value) {},
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
                            hinttext: passwordhint,
                            controller: password,
                            onchange: (value) {},
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
                          SizedBox(
                            height: height * .05,
                          ),
                          GestureDetector(
                            onTap: () {
                              buttonState();
                              if (_formKey.currentState!.validate()) {
                                loginCall(email.text, password.text,context);
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 50),
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
                                  loginhint,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * .06,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ));
                                  },
                                  child: const Text(
                                    signuphint,
                                    style: TextStyle(color: ambercolor),
                                  )),
                              const Text(needsupport,
                                  style: TextStyle(color: whitecolor)),
                              TextButton(
                                onPressed: () {},
                                child: const Text(help,
                                    style: TextStyle(color: ambercolor)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
