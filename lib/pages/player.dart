import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlay extends StatefulWidget {
  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
    );
  }
}
