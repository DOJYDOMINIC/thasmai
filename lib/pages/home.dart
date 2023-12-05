import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:thasmai/constants/consts.dart';
import 'package:thasmai/pages/payment.dart';

import 'meditaioncycle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<DateTime, int> datas = {
    DateTime(2023, 11, 29): 1,
    DateTime(2023, 11, 30): 1,
    DateTime(2023, 12, 1): 2,
    DateTime(2023, 12, 2): 2,
    DateTime(2023, 12, 3): 1,
  };

  bool isPressed = false;

  void ButtonState() {
    setState(() {
      isPressed = !isPressed;
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isPressed = !isPressed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.1,
              // Replace 'bgimage' with your image asset
              image: AssetImage(bgimage),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                      SizedBox(width: 45, height: 45, child: Image.asset(logo)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          home,
                          style: headstyl,
                        ),
                        Row(
                          children: [
                            Text('referLink'),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.copy,
                                size: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: decor,
                            height: height * .16,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: height * .08,
                                        width: width * 0.19,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(person),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "name",
                                            style: hometextw,
                                          ),
                                          Container(
                                            child: Text(
                                              "DOJ : 20-11-2023",
                                              style: hometextw,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("cardnumber", style: hometextw),
                                          Text("40000", style: hometextw),
                                        ],
                                      ),
                                      Text("Valid: 11-2027", style: hometextw),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .05,
                      ),
                      Expanded(
                        child: Container(
                          height: height * .16,
                          decoration: decor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  "Completed\nCycle",
                                  style: hometextw,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "3",
                                  style: timeStyl,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentPage()));
                            },
                            child: Container(
                              decoration: decor,
                              height: height * .15,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.credit_card_outlined,
                                    color: whitecolor,
                                    size: 50,
                                  ),
                                  Text(
                                    "Payment",
                                    style: hometextw,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: height * .15,
                            decoration: decor,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Current cycle        ",
                                        style: hometextw,
                                      ),
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.grey.shade800,
                                              Colors.black,
                                              Colors.black,
                                            ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "3",
                                            style: hometextw,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Days completed   ",
                                        style: hometextw,
                                      ),
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.grey.shade800,
                                              Colors.black,
                                              Colors.black,
                                            ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "12",
                                            style: hometextw,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * .10,
                            decoration: decor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mail_outline,
                                  color: whitecolor,
                                ),
                                Text(
                                  "Message",
                                  style: hometextw,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            height: height * .10,
                            decoration: decor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.quick_contacts_dialer_outlined,
                                  color: whitecolor,
                                ),
                                Text(
                                  "Appointment",
                                  style: hometextw,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            height: height * .10,
                            decoration: decor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.message,
                                  color: whitecolor,
                                ),
                                Text(
                                  "Rewards & Notes",
                                  style: hometextw,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: Colors.green.shade400,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          Text("complete"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          Text("incomplete"),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: decorone,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Calender",
                                  style: timeStyl,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: width / 2.6,
                                  decoration: BoxDecoration(
                                    color: whitecolor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: HeatMapCalendar(
                                    monthFontSize: 6,
                                    defaultColor: Colors.grey.shade100,
                                    fontSize: 10,
                                    size: .5,
                                    initDate: DateTime.now(),
                                    margin: EdgeInsets.all(1),
                                    flexible: true,
                                    weekFontSize: 8,
                                    weekTextColor: blackcolor,
                                    colorMode: ColorMode.color,
                                    showColorTip: false,
                                    textColor: blackcolor,
                                    datasets: datas,
                                    colorsets: const {
                                      1: Color.fromARGB(255, 109, 208, 112),
                                      2: Color.fromARGB(255, 255, 122, 120),
                                    },
                                    onClick: (value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>Meditationcycle())),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Meditation \nTimer",
                                    style: timeStyl,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: height * .03,
                                  ),
                                  Icon(
                                    Icons.access_time,
                                    color: whitecolor,
                                    size: 100,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
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

class MyContinuousRotatingImage extends StatefulWidget {
  @override
  _MyContinuousRotatingImageState createState() =>
      _MyContinuousRotatingImageState();
}

class _MyContinuousRotatingImageState extends State<MyContinuousRotatingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // You can adjust the duration
    )..repeat(); // This will make the animation loop
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        "assets/images/logo 4.png",
        width: 150.0,
        height: 155,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
