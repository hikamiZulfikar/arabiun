// import 'dart:async';
// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:project/features/materi/kosakata/materi_kosakata_pages.dart';
// import 'package:project/styles/assets.dart';
// import 'package:project/styles/button_styles.dart';
// import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import '../styles/color.dart';
// import '../styles/text_styles.dart';

// class VideoPages extends StatefulWidget {
//   const VideoPages({Key? key}) : super(key: key);

//   @override
//   State<VideoPages> createState() => _VideoPagesState();
// }

// class _VideoPagesState extends State<VideoPages> {
//   late YoutubePlayerController controller;

//   @override
//   void initState() {
//     super.initState();
//     const url = 'https://www.youtube.com/watch?v=GQyWIur03aw';

//     controller = YoutubePlayerController(
//         initialVideoId: YoutubePlayer.convertUrlToId(url)!,
//         flags: const YoutubePlayerFlags(
//           mute: false,
//           loop: false,
//           autoPlay: true,
//         ));
//   }

//   @override
//   void deactivate() {
//     controller.pause();

//     super.deactivate();
//   }

//   @override
//   Widget build(BuildContext context) => YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: controller,
//         ),
//         builder: (context, player) => Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back, color: AppColor.blackLight),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const MateriKosakataPages()),
//                 );
//               },
//             ),
//             title: Text("Materi", style: TextStyles.headline4),
//             backgroundColor: Colors.white,
//             elevation: 0,
//           ),
//           body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Container(
//                 padding: EdgeInsets.all(20),
//                 width: 420,
//                 height: 280,
//                 child: player),
//             const SizedBox(height: 12),
//             Container(
//               padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: Text(
//                 "Video Tutorial",
//                 style: TextStyles.headline4,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: Text(
//                 "05.20 Menit",
//                 style: TextStyles.subtitle1,
//               ),
//             )
//           ]),
//         ),
//       );
// }
