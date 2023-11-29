import 'package:flutter/material.dart';
import 'package:thasmai/constants/consts.dart';
import 'package:thasmai/pages/profileedit.dart';
import 'package:thasmai/widgets/bottombutton.dart';
import 'package:thasmai/widgets/boxquiz.dart';

import '../widgets/mydrawer.dart';

class MeditationData extends StatefulWidget {
  const MeditationData({super.key});

  @override
  State<MeditationData> createState() => _MeditationDataState();
}

class _MeditationDataState extends State<MeditationData> {
  bool isPressed = false;

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;

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

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          // width: 300,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.1,
              image: AssetImage(bgimage),
            ),
          ),
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
                            icon:
                                Icon(Icons.menu, color: Colors.black, size: 35),
                          );
                        },
                      ),
                      SizedBox(width: 45, height: 45, child: Image.asset(logo))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(meddatahed, style: welcomeheading),
                          ],
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: TextFormField(
                                    cursorHeight: 20,
                                    controller: id,
                                    decoration: InputDecoration(
                                      hintText: 'Referel ID',
                                      labelStyle: TextStyle(color: ambercolor),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 10.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Colors
                                              .black, // Change the color as needed
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      // Set the background color of the button
                                      foregroundColor: Colors.white,
                                      backgroundColor: blackcolor,
                                      shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {},
                                  child: Text("find"))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .1,
                        ),
                        BoxQuiz(
                          value: checkbox1,
                          text: subtxtlogin,
                          onChanged: (value) {
                            setState(() {
                              checkbox1 = value!;
                            });
                          },
                        ),
                        BoxQuiz(
                          value: checkbox2,
                          text: subtxtlogin,
                          onChanged: (value) {
                            setState(() {
                              checkbox2 = value!;
                            });
                          },
                        ),
                        BoxQuiz(
                          value: checkbox3,
                          text: subtxtlogin,
                          onChanged: (value) {
                            setState(() {
                              checkbox3 = value!;
                            });
                          },
                        ),
                        BoxQuiz(
                          value: checkbox4,
                          text: subtxtlogin,
                          onChanged: (value) {
                            setState(() {
                              checkbox4 = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: height * .1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(needsupport,
                                style: TextStyle(color: blackcolor)),
                            TextButton(
                              onPressed: () {},
                              child: const Text(help,
                                  style: TextStyle(color: ambercolor)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        BottomButton(
                            boolval: isPressed,
                            buttontext: contnu,
                            ontap: () {
                              ButtonState();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
                            }),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(cancel,
                                  style: TextStyle(color: blackcolor)),
                            )
                          ],
                        ),
                      ],
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
