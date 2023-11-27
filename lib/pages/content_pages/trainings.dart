import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class Trainings extends StatefulWidget {
  const Trainings({Key? key}) : super(key: key);

  @override
  State<Trainings> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<Trainings> {
  late final PodPlayerController controller;
  late final PodPlayerController controller1;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
        'https://www.youtube.com/embed/zmNNxdLBaf8',
      ),
    )..initialise();

    controller1 = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
        'https://www.youtube.com/embed/P6EtYMHL7Wc',
      ),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: false,
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        children: [
          const SizedBox(height: 16),
          PodVideoPlayer(controller: controller),
          const SizedBox(height: 16),
          PodVideoPlayer(controller: controller1),
        ],
      ),
    );
  }
}
