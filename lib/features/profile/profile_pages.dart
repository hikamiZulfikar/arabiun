import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/loading_widget.dart';
import 'package:project/features/profile/ganti_profile_pages.dart';
import 'package:project/features/profile/nilai_quiz_pages.dart';
import 'package:project/features/profile/progress_materi.dart';
import 'package:project/main.dart';
import 'package:project/splash_screen.dart';
import 'package:project/styles/assets.dart';
import 'package:project/styles/button_styles.dart';
import 'package:project/styles/color.dart';
import 'package:project/global_widgets/card_aplikasi_widget.dart';

import '../../styles/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                        margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                        child: Text(
                          snapshot.data?["name"],
                          style: TextStyles.headline4,
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
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardProfile(
                              title: "Progres Materi",
                              subtitle:
                                  "Kamu dapat melihat progres pembelajaran",
                              icon: AppAssets.icProfile1,
                              textButton: "BELAJAR",
                              navigasi: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProgressMateriScreen(),
                                  ),
                                );
                              },
                              color: AppColor.cardblue,
                            ),
                            const SizedBox(height: 20.0),
                            CardProfile(
                              title: "Nilai Quiz",
                              subtitle: "Kamu dapat melihat hasil quiz kamu",
                              icon: AppAssets.icTeamwork,
                              textButton: "LIHAT",
                              navigasi: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NilaiQuizPages(),
                                  ),
                                );
                              },
                              color: AppColor.cardred,
                            ),
                            const SizedBox(height: 20.0),
                            CardProfile(
                              title: "Ganti Profil",
                              subtitle: "Kamu dapat mengubah profile sendiri",
                              icon: AppAssets.icProfile2,
                              textButton: "LIHAT",
                              navigasi: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GantiProfile()),
                                );
                              },
                              color: AppColor.cardcream,
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  ArtDialogResponse response =
                                      await ArtSweetAlert.show(
                                    barrierDismissible: false,
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      denyButtonText: "Engga",
                                      title: "Kamu Yakin?",
                                      text: "Kamu harus login lagi nanti...",
                                      confirmButtonText: "Iya",
                                      type: ArtSweetAlertType.warning,
                                    ),
                                  );

                                  if (response.isTapConfirmButton) {
                                    await auth.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SplashScreen()),
                                        (route) => false);
                                  } else {
                                    return;
                                  }
                                },
                                style:
                                    PrimaryButtons.filledButtonStylePrimaryBase,
                                child: Text(
                                  "KELUAR",
                                  style: TextStyles.button
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
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
