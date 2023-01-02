import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery/videoitems.dart';

class VideoWidgets extends StatefulWidget {
  final String? videoUrl;
  const VideoWidgets({Key? key, this.videoUrl}) : super(key: key);

  @override
  State<VideoWidgets> createState() => _VideoWidgetsState();
}

class _VideoWidgetsState extends State<VideoWidgets>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? stopAnimation;
  Animation<Color>? animation2;
  bool animatedbool = false;
  double menuWidth = 150;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    stopAnimation =
        Tween<double>(begin: 0, end: .7).animate(animationController!);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoScreen(
            stopAnimationFunc: (bool startPress) {
              animationController!.forward();
            },
            videoUrl: widget.videoUrl!),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 50,
            height: 150,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
