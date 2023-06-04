import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/styles/assets.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HurufHijaiyahDetailPages extends StatefulWidget {
  final int index;

  const HurufHijaiyahDetailPages({super.key, required this.index});

  @override
  State<HurufHijaiyahDetailPages> createState() =>
      _HurufHijaiyahDetailPagesState();
}

class _HurufHijaiyahDetailPagesState extends State<HurufHijaiyahDetailPages> {
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  late FlickManager flickManager;
  // late YoutubePlayerController _youtubePlayerController;

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    debugPrint(AppAssets.huruf[widget.index]["video"]);

    _videoPlayerController =
        VideoPlayerController.network('${AppAssets.huruf[widget.index]["video"]}')
          ..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        settingsButtonAvailable: false,
        deviceOrientationsAfterFullscreen: [DeviceOrientation.portraitUp],
        placeholderWidget: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(AppAssets.huruf[widget.index]["id"].toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.blackLight),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(AppAssets.huruf[widget.index]["read"],
            style: TextStyles.headline4),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          decoration: BoxDecoration(
            color: AppColor.cardbluelight,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 2,
              color: AppColor.blackBase,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: AppColor.cardbluelight,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 2,
                color: AppColor.blackBase,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        AppAssets.huruf[widget.index]["read"],
                        style: TextStyles.headline4,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          player.play(AssetSource(
                              AppAssets.huruf[widget.index]["audio"]));
                        },
                        child: Image.asset(AppAssets.icAudio),
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //   child: AspectRatio(
                //     aspectRatio: 16 / 9,
                //     child: FlickVideoPlayer(
                //       flickManager: flickManager,
                //       flickVideoWithControls: const FlickVideoWithControls(
                //         closedCaptionTextStyle: TextStyle(fontSize: 8),
                //         controls: FlickPortraitControls(),
                //       ),
                //       flickVideoWithControlsFullscreen: const FlickVideoWithControls(
                //         controls: FlickLandscapeControls(),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CustomVideoPlayer(
                      customVideoPlayerController: _customVideoPlayerController,
                    ),
                  ),
                ),
                // YoutubePlayerBuilder(
                //   player: YoutubePlayer(
                //     controller: _youtubePlayerController,
                //   ),
                //   builder: (context, player) {
                //     return Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //       child: AspectRatio(
                //         aspectRatio: 16 / 9,
                //         child: player,
                //       ),
                //     );
                //   },
                // ),
                verticalSizedBox(20.0),
                AppAssets.huruf[widget.index]["attribut"],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
