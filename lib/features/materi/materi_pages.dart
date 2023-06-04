import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/loading_widget.dart';
import 'package:project/features/materi/kosakata/materi_kosakata_pages.dart';
import 'package:project/main.dart';
import 'package:project/styles/assets.dart';
import 'package:project/global_widgets/card_aplikasi_widget.dart';

import '../../styles/color.dart';
import '../../styles/text_styles.dart';
import 'huruf_hijaiyah/materi_hijaiyah_pages.dart';

class MateriPages extends StatelessWidget {
  const MateriPages({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots();

    return StreamBuilder<DocumentSnapshot>(
      stream: usersStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Terjadi Kesalahan');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AuthLoading();
        }

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Column(
                  children: [
                    const Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      color: AppColor.primaryLightest,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/avatar/${snapshot.data?["avatar"]}",
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selamat datang kembali,',
                                  style: TextStyles.headline4,
                                ),
                                Text(
                                  "${snapshot.data?["name"]} 👋",
                                  style: TextStyles.headline4,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20.0,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColor.primaryLightest,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apa yang ingin kamu pelajari hari ini?",
                              style: TextStyles.subtitle1,
                            ),
                            const SizedBox(height: 20.0),
                            CardProfile(
                              title: "Huruf Hijaiyah",
                              subtitle: "Mari Belajar huruf hijaiyah",
                              icon: AppAssets.icArabic,
                              textButton: "BELAJAR",
                              navigasi: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MateriHijaiyahPages(),
                                  ),
                                );
                              },
                              color: AppColor.cardorange,
                            ),
                            const SizedBox(height: 20.0),
                            CardProfile(
                              title: "Kosakata ",
                              subtitle:
                                  "Mari belajar kosakata\nbahasa arab",
                              icon: AppAssets.icQuran,
                              textButton: "BELAJAR",
                              navigasi: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MateriKosakataPages(),
                                  ),
                                );
                              },
                              color: AppColor.cardgreenlight,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
