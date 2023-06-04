import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/authentication/widgets/loading_widget.dart';
import 'package:project/features/materi/kosakata/glosarium/model/profesi_1_list.dart';
import 'package:project/global_widgets/duration_helpers.dart';
import 'package:project/main.dart';
import 'package:project/styles/assets.dart';
import 'package:project/styles/text_styles.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class GlosariumProfesi extends StatefulWidget {
  const GlosariumProfesi({super.key});

  @override
  State<GlosariumProfesi> createState() => _GlosariumProfesiState();
}

class _GlosariumProfesiState extends State<GlosariumProfesi> {
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      '${AppAssets.github_link}/video_materi/PROFESI_1.mp4',
    )..initialize().then((value) => setState(() {}));

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
    final Stream<QuerySnapshot> usersStream = firestore
        .collection('materi_kosakata_profesi_1')
        .doc(auth.currentUser!.uid)
        .collection('materi_list')
        .orderBy('id')
        .snapshots();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Video Pembelajaran",
            style: TextStyles.headline4,
          ),
          verticalSizedBox(12.0),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController,
            ),
          ),
          verticalSizedBox(8.0),
          Text(
            "Kosakata Profesi",
            style: TextStyles.subtitle1,
          ),
          verticalSizedBox(8.0),
          ValueListenableBuilder(
            valueListenable: _videoPlayerController,
            builder: (context, VideoPlayerValue value, child) {
              return Text(
                videoDuration(value.position),
                style: TextStyles.subtitle1,
              );
            },
          ),
          verticalSizedBox(20.0),
          Text(
            "Glosarium",
            style: TextStyles.headline4,
          ),
          verticalSizedBox(12.0),
          StreamBuilder<QuerySnapshot>(
            stream: usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const AuthLoading();
              }

              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      await firestore
                          .collection('materi_kosakata_profesi_1')
                          .doc(auth.currentUser!.uid)
                          .update({
                        'last_click': ProfesiSatuMateri.listMateriProfesi1[0]
                            ['materi_list'][index]['title']
                      });

                      player.play(AssetSource(
                          ProfesiSatuMateri.listMateriProfesi1[0]['materi_list']
                              [index]["audio"]));

                      await firestore
                          .collection('materi_kosakata_profesi_1')
                          .doc(auth.currentUser!.uid)
                          .collection('materi_list')
                          .doc((index + 1).toString())
                          .update({'status': true}).catchError(
                        (error) => ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.danger,
                            title: "Error !",
                            text: "Terjadi Kesalahan\n $error",
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(
                              int.parse(
                                ProfesiSatuMateri.listMateriProfesi1[0]
                                    ['materi_list'][index]["color"],
                              ),
                            ),
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                ProfesiSatuMateri.listMateriProfesi1[0]
                                    ['materi_list'][index]['image'],
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                ProfesiSatuMateri.listMateriProfesi1[0]
                                    ['materi_list'][index]["title"],
                                style: TextStyles.body2,
                              ),
                              Text(
                                ProfesiSatuMateri.listMateriProfesi1[0]
                                    ['materi_list'][index]["arab"],
                                style: TextStyles.headline3,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 20.0,
                          right: 20.0,
                          child: Icon(
                            Icons.star,
                            color: snapshot.data!.docs[index]['status'] == true
                                ? Colors.yellow
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
