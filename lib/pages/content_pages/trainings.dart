import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart'; // Import services to use SystemChrome

class Trainings extends StatefulWidget {
  @override
  _TrainingsState createState() => _TrainingsState();
}

class _TrainingsState extends State<Trainings> {
  // List of video IDs
  final List<String> _videoIds = [
    'zmNNxdLBaf8', // Example YouTube video ID
    'P6EtYMHL7Wc', // Example YouTube video ID
  ];

  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = _videoIds.map<YoutubePlayerController>((videoId) {
      return YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          hideThumbnail: false,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _controllers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: YoutubePlayerBuilder(
                onEnterFullScreen: () {
                  // Hide all system overlays
                  SystemChrome.setEnabledSystemUIMode(
                      SystemUiMode.immersiveSticky);
                },
                onExitFullScreen: () {
                  // Show status bar and navigation bar
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                },
                player: YoutubePlayer(
                  controller: _controllers[index],
                  showVideoProgressIndicator: true,
                ),
                builder: (context, player) {
                  return Column(
                    children: [
                      // some widgets
                      player,
                      //some other widgets
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose all controllers to avoid memory leaks
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
