import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:thasmai/constants/consts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../widgets/bottombutton_w.dart';

class Meditationcycle extends StatefulWidget {
  const Meditationcycle({Key? key}) : super(key: key);

  @override
  State<Meditationcycle> createState() => _MeditationcycleState();
}

class _MeditationcycleState extends State<Meditationcycle> {
  bool isPressed = false;
  late Color sun; // Added this line
  late Color moon; // Added this line

  @override
  void initState() {
    super.initState();
    _Meditationtime();
    _initializeVideoController();
  }
  late YoutubePlayerController _controller;
  void _initializeVideoController() {
    DateTime now = DateTime.now();
    String videoId;

    // Check if it's morning (6:00 AM to 9:00 AM)
    if (now.hour >= 6 && now.hour < 9) {
      videoId = 'aH96tw8fXfk'; // Replace with your morning video ID
    } else if (now.hour >= 18 && now.hour < 22) {
      // Check if it's evening (6:30 PM to 10:00 PM)
      videoId = 'kvRq5sJsuHY'; // Replace with your evening video ID
    } else {
      // Default video ID for other times
      videoId = 'aH96tw8fXfk'; // Replace with your default video ID
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false, // Don't set loop to true to handle replay manually
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );

    _controller.addListener(() {
      if (_controller.value.playerState == PlayerState.ended) {
        // Video has ended, seek to the beginning to replay
        _controller.seekTo(const Duration(microseconds: 1000));
        _controller
            .pause(); // Optionally, you can auto-play after seeking to the beginning
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _Meditationtime() {
    DateTime now = DateTime.now();

    // Initialize default values
    sun = Colors.grey;
    moon = Colors.grey;

    // Check if it's morning (6:00 AM to 12:00 PM)
    if (now.hour >= 6 && now.hour < 9) {
      sun = ambercolor; // Replace with your morning border color
    }
    // Check if it's afternoon (12:00 PM to 6:00 PM)
    else if (now.hour >= 18 && now.hour < 22) {
      moon = ambercolor; // Replace with your afternoon border color
    }
  }

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.1, fit: BoxFit.cover, image: AssetImage(bgimage))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
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
                          icon: Icon(Icons.menu, color: Colors.black, size: 35),
                        );
                      },
                    ),
                    SizedBox(width: 45, height: 45, child: Image.asset(logo)),
                  ],
                ),
                // Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        medicycle,
                        style: headstyl,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(cycle,style: timetheam,),
                Text(day,style: timetheam,),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Time"),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.grey.shade900, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            color: Colors.black,
                            border: Border.all(width: 4, color: sun), // Updated this line
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text("Time"),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.grey.shade900, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            border: Border.all(width: 4, color: moon), // Updated this line
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                onReady: () {
                  // You can perform actions when the player is ready.
                  print("ready");
                },
              ),
            ),
                Spacer(),
            // CircularCountDownTimer(
            //   duration: 45 * 60, // 45 minutes in seconds
            //   initialDuration: 0,
            //   controller: CountDownController(),
            //   width: MediaQuery.of(context).size.width / 2,
            //   height: MediaQuery.of(context).size.height / 2,
            //   ringColor: Colors.grey.shade300,
            //   ringGradient: null,
            //   fillColor: Colors.amber,
            //   fillGradient: null,
            //   backgroundColor: Colors.white,
            //   backgroundGradient: null,
            //   strokeWidth: 10.0,
            //   strokeCap: StrokeCap.round,
            //   textStyle: TextStyle(
            //     fontSize: 30.0,
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   textFormat: CountdownTextFormat.MM_SS,
            //   isReverse: true,
            //   isReverseAnimation: false,
            //   isTimerTextShown: true,
            //   autoStart: false,
            //   onStart: () {
            //     // Timer started
            //     print('Timer started');
            //   },
            //   onComplete: () {
            //     // Timer completed
            //     print('Timer completed');
            //   },
            // ),
                BottomButton(
                  boolval: isPressed,
                  buttontext: contnu,
                  ontap: () {
                    ButtonState();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => YourNextScreen(),
                    //   ),
                    // );
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
