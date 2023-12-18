import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:intl/intl.dart';
import 'package:thasmai/constants/consts.dart';
import 'package:thasmai/pages/home.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}


class _TimerScreenState extends State<TimerScreen> {



  bool isTimerRunning = false; // Flag to track if the timer is running

  //
  // DateTime selectedDate = DateTime.now();
  // TimeOfDay selectedTime = TimeOfDay.now();
  String formatDate(DateTime date) {
    return DateFormat('yyyy,MM,dd').format(date);
  }// to convert the date in a required format

  late CountDownController _controller;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = CountDownController();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        icon: Icon(Icons.menu, color: Colors.black, size: 35),
                      );
                    },
                  ),
                  SizedBox(width: 45, height: 45, child: Image.asset(logo)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      "Meditation",
                      style: headstyl,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text("$cycle 3", style: timetheam),
              Text("$day 12", style: timetheam),
              CircularCountDownTimer(
                duration: 3,
                initialDuration: 0,
                controller: _controller,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Colors.grey.shade300,
                fillColor: Colors.amber,
                backgroundColor: Colors.black,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: false,
                onComplete: () {
                  // Timer completed
                  print('Timer completed');
                  setState(() {
                    isCompleted = true;
                    isTimerRunning = false; // Timer completed, set the flag to false
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    isCompleted ? Colors.green : Colors.black,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 15, horizontal: width / 4),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (isCompleted) {
                    // If the timer is completed, navigate to the home screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else if (!isTimerRunning) {
                    // If the timer is not completed and not running, start it
                    _controller.start();
                    setState(() {
                      isTimerRunning = true;
                    });
                  }
                },
                child: Text(
                  isCompleted ? "Completed" : 'Start',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  if (!isCompleted) {
                    DateTime selectedDate = DateTime.now();
                    TimeOfDay selectedTime = TimeOfDay.now();
                    // If the timer is not completed, cancel the timer
                    print(formatDate(selectedDate));
                    print(selectedTime.format(context));
                    _controller.reset();
                    setState(() {
                      isCompleted = false; // Reset the completion status
                      isTimerRunning = false; // Reset the running status
                    });
                  }
                },
                child: Text( "Cancel"),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
