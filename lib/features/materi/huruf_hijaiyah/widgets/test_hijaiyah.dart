import 'package:flutter/material.dart';
import 'package:project/features/materi/huruf_hijaiyah/materi_hijaiyah_pages.dart';
import 'package:project/styles/assets.dart';

import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../../global_widgets/card_hijaiyah_test.dart';

class TestHijaiyah extends StatefulWidget {
  const TestHijaiyah({Key? key}) : super(key: key);

  @override
  State<TestHijaiyah> createState() => _TestHijaiyahState();
}

class _TestHijaiyahState extends State<TestHijaiyah> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.blackLight),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MateriHijaiyahPages()),
            );
          },
        ),
        title: Text("Materi Huruf Hijaiyah", style: TextStyles.headline4),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColor.primaryLightest,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  /// Alif
                  TestWidget(
                    huruf: "Alif",
                    akhir: "ـــا",
                    tengah: "ــا",
                    awal: "ا",
                    suara: () {
                      player.play(AssetSource(AppAssets.hjAlif));
                    },
                  ),
                  SizedBox(height: 12),

                  /// Ba
                  TestWidget(
                      huruf: "Ba",
                      akhir: "ـــب",
                      tengah: "ــــبـــ",
                      awal: "بـ",
                      suara: () {
                        player.play(AssetSource('assets/alif.mp4'));
                      }),
                  SizedBox(height: 12),

                  /// Ta
                  TestWidget(
                      huruf: "Ta",
                      akhir: "ـــت",
                      tengah: "ـــتـــ",
                      awal: "تـ",
                      suara: () {
                        player.play(AssetSource('assets/suara/alif.wav'));
                      }),
                  SizedBox(height: 12),

                  /// Tsa
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
