import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  final Function? stopAnimationFunc;
  const VideoScreen({Key? key, required this.videoUrl, this.stopAnimationFunc})
      : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
    controller.play();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.network(widget.videoUrl)
      ..setLooping(true);
    controller.addListener(() {

    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (controller.value.isPlaying) {
            widget.stopAnimationFunc!(false);
            controller.pause();
          } else {
            widget.stopAnimationFunc!(true);
            controller.play();
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
