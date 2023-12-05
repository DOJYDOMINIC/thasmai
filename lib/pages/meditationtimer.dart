import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late CountDownController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CountDownController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularCountDownTimer(
              duration: 45 * 60,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              ringColor: Colors.grey.shade300,
              fillColor: Colors.amber,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
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
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Start, pause, or resume the timer based on its current state
                // _controller.start();
                if (_controller.isStarted) {
                  _controller.pause();
                } else if (_controller.isPaused) {
                  _controller.resume();
                } else {
                  _controller.start();
                }
              },
              child: Text(_controller.isPaused ? 'Resume' : 'Start/Pause'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Reset the timer
                _controller.restart(duration: 45 * 60);
              },
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
