import 'package:flutter/material.dart';
import 'package:thasmai/constants/consts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../widgets/bottombutton_w.dart';
import 'meditationtimer.dart';

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
    _initializeVideoController();
  }

  late YoutubePlayerController _controller;
  void _initializeVideoController() {
    DateTime now = DateTime.now();

    String videoId;
    sun = Colors.grey;
    moon = Colors.grey;

    // Check if it's morning (6:00 AM to 9:00 AM)
    if (now.hour >= 6 && now.hour < 12) {
      sun = ambercolor; // Replace with your morning border color
      videoId = 'aH96tw8fXfk'; // Replace with your morning video ID
    } else if (now.hour >= 12 && now.hour < 22) {
      // Check if it's evening (6:30 PM to 10:00 PM)
      moon = ambercolor; // Replace with your afternoon border color
      videoId = 'kvRq5sJsuHY'; // Replace with your evening video ID
    } else {
      // Default video ID for other times
      videoId = '60ItHLz5WEA'; // Replace with your default video ID
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false, // Don't set loop to true to handle replay manually
        isLive: false,
        forceHD: false,
        enableCaption: false,
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

  // void _Meditationtime() {
  //   DateTime now = DateTime.now();
  //
  //   // Initialize default values
  //   sun = Colors.grey;
  //   moon = Colors.grey;
  //
  //   // Check if it's morning (6:00 AM to 12:00 PM)
  //   if (now.hour >= 6 && now.hour < 9) {
  //     sun = ambercolor; // Replace with your morning border color
  //   }
  //   // Check if it's afternoon (12:00 PM to 6:00 PM)
  //   else if (now.hour >= 18 && now.hour < 22) {
  //     moon = ambercolor; // Replace with your afternoon border color
  //   }
  // }

  void ButtonState() {
    setState(() {
      isPressed = !isPressed;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      isPressed = !isPressed;
      setState(() {});
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
                Text(
                  "$cycle 3",
                  style: timetheam,
                ),
                Text(
                  "$day 12",
                  style: timetheam,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("6 AM : 9 AM"),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [Colors.grey.shade900, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            color: Colors.black,
                            border: Border.all(
                                width: 4, color: sun), // Updated this line
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/sun.png")),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text("6 PM : 10 PM"),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [Colors.grey.shade900, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            border: Border.all(
                                width: 4, color: moon), // Updated this line
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/moon.png")),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the radius as needed
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                    onReady: () {
                      // You can perform actions when the player is ready.
                      print("ready");
                    },
                  ),
                ),
                Spacer(),
                BottomButton(
                  boolval: isPressed,
                  buttontext: contnu,
                  ontap: () {
                    DateTime now = DateTime.now();
                    ButtonState();
                    // Check the time conditions to determine whether to navigate or not
                    if ((now.hour >= 6 && now.hour < 12) ||
                        (now.hour >= 12 && now.hour < 22)) {
                      // Enable the button during morning (6 AM to 9 AM) and evening (6 PM to 10 PM)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TimerScreen(),
                        ),
                      );
                    } else {
                      // Button is disabled for other times
                      // You can add code to handle the case when the button is disabled
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Button is disabled at this time.'),
                        ),
                      );
                    }
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
