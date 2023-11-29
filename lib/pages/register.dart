import 'package:flutter/material.dart';
import 'package:thasmai/constants/consts.dart';
import 'package:thasmai/pages/login.dart';
import 'package:thasmai/widgets/main_fields.dart';
import '../widgets/mydrawer.dart';
import 'meditationdata.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  double val = .18;

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
  bool isPressed = false;
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:Colors.black,
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill
                    , image: AssetImage(bgimage))),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: SafeArea(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(Icons.menu,
                                color: Colors.black, size: 35),
                          );
                        },
                      ),
                      SizedBox(width: 45, height: 45, child: Image.asset(logo))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 5),
                    child: Column(
                      children: [
                         Container(child: Text(welcome, style: welcomeheading)),
                         Container(
                             child: Text(subtxtreg,style: substyl)),
                        SizedBox(
                          height:  height * val,
                        ),
                        TextFieldOne(
                          hintText: emailhint,
                          controller: email,
                          onchange: (value) {
                            // _email = value!;
                          },
                          obsecuretxt: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //val = .09;
                              return 'Please enter your email';
                            }
                            // Use a regular expression for basic email validation
                            if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value)) {
                              //val = .09;
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        TextFieldOne(
                          hintText: phonehint,
                          controller: phone,
                          onchange: (value) {},
                          obsecuretxt: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //val = .09;
                              return 'Please enter your phone number';
                            }

                            // Use a regular expression to check for a valid phone number format
                            if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                              //val = .09;
                              return 'Please enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                        TextFieldOne(
                          hintText: newpasswordhint,
                          controller: password,
                          onchange: (value) {},
                          obsecuretxt: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //val = .09;
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              //val = .09;
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        TextFieldOne(
                          hintText: confirmpasswordhint,
                          controller: confirmpass,
                          onchange: (value) {},
                          obsecuretxt: false,
                          validator: (value) {
                            //val = .09;
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != password.text) {
                              //val = .09;
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * .04,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ButtonState();
                              // if (_formKey.currentState!.validate()) {
                                // Form is valid, perform your action
                                // _formKey.currentState!.save();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MeditationData(),));

                                // print('Email submitted: $_email');
                              // }
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 50),
                            height: 60,
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
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height*.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));

                            }, child: const Text(loginhint,style: TextStyle(color: ambercolor),)),
                             Text(needsupport,style: TextStyle(color:whitecolor)),
                            TextButton(onPressed: (){}, child: const Text(help,style: TextStyle(color: ambercolor)),)
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
