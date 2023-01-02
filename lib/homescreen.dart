import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery/screens/videoscreen.dart';
import 'package:grocery/videoitems.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List videos = [
    'https://vimeo.com/777755005',
    'https://player.vimeo.com/external/579933573.sd.mp4?s=baf4f2f350e3e65cb38ee64f4491324f3b4ef306&profile_id=165&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/554310916.hd.mp4?s=99c6bb71412a2cf41c065b10664707955f2555a1&profile_id=174&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/651066537.hd.mp4?s=e44515f95c28f9f84414e8117a20f598098f42bf&profile_id=174&oauth_token_id=57447761',
    'https://player.vimeo.com/external/509919122.sd.mp4?s=6236600fa73feb9ef0af0e80f9106cc575d0a16c&profile_id=165&oauth2_token_id=57447761',
    'https://player.vimeo.com/progressive_redirect/playback/714854875/rendition/540p/file.mp4?loc=external&oauth2_token_id=57447761&signature=3b0ebac0d2bc8dcca37e7d5660ca318ff337dfbb6d029a8f7503eaacfc699343'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: videos.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return VideoWidgets(
              videoUrl: videos[index],
            );
          }),
    );
  }
}
