import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/loading_widget.dart';
import 'package:project/features/quiz/quiz_soal_pages.dart';
import 'package:project/main.dart';
import 'package:project/styles/assets.dart';

import '../../styles/color.dart';
import '../../styles/text_styles.dart';

import '../../global_widgets/card_aplikasi_widget.dart';

class QuizPages extends StatelessWidget {
  const QuizPages({super.key});

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

        num quizH0a = 3 - snapshot.data?["quiz_hijaiyah0_attempts"];
        num quizK7a = 3 - snapshot.data?["quiz_kosakata7_attempts"];
        num quizK9a = 3 - snapshot.data?["quiz_kosakata9_attempts"];

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
                        child: Text(
                          'Yuk mulai asah kemampuan bahasa arab teman-teman',
                          style: TextStyles.headline4,
                        ),
                      ),
                      Column(
                        children: [
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
                                  "Silahkan pilih materinya teman-teman",
                                  style: TextStyles.subtitle1,
                                ),
                                const SizedBox(height: 20.0),
                                CardProfile(
                                  title: "Kuis Huruf Hijaiyah",
                                  subtitle:
                                      "Sisa Percobaan : ${quizH0a.toString()}",
                                  icon: AppAssets.icArabic,
                                  navigasi: () {
                                    quizH0a != 0
                                        ? Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  QuizSoalPages(
                                                materi: "hijaiyah0",
                                                attempt: snapshot.data?[
                                                    "quiz_hijaiyah0_attempts"],
                                              ),
                                            ),
                                            (route) => false,
                                          )
                                        : ArtSweetAlert.show(
                                            context: context,
                                            artDialogArgs: ArtDialogArgs(
                                              type: ArtSweetAlertType.danger,
                                              title: "Kesempatan Habis !",
                                              text:
                                                  "Sisa percobaan kamu buat mengisi quiz telah dipakai semua",
                                            ),
                                          );
                                  },
                                  textButton: "MULAI",
                                  color: AppColor.cardyelow,
                                ),
                                const SizedBox(height: 20.0),
                                CardProfile(
                                  title: "Kuis Kosakata Kelas 7",
                                  subtitle:
                                      "Sisa Percobaan : ${quizK7a.toString()}",
                                  icon: AppAssets.icQuran,
                                  textButton: "MULAI",
                                  navigasi: () {
                                    quizK7a != 0
                                        ? Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  QuizSoalPages(
                                                materi: "kosakata7",
                                                attempt: snapshot.data?[
                                                    "quiz_kosakata7_attempts"],
                                              ),
                                            ),
                                            (route) => false,
                                          )
                                        : ArtSweetAlert.show(
                                            context: context,
                                            artDialogArgs: ArtDialogArgs(
                                              type: ArtSweetAlertType.danger,
                                              title: "Kesempatan Habis !",
                                              text:
                                                  "Sisa percobaan kamu buat mengisi quiz telah dipakai semua",
                                            ),
                                          );
                                  },
                                  color: AppColor.cardgreenlight,
                                ),
                                const SizedBox(height: 20.0),
                                CardProfile(
                                  title: "Kuis Kosakata Kelas 9",
                                  subtitle:
                                      "Sisa Percobaan : ${quizK9a.toString()}",
                                  icon: AppAssets.icQuran,
                                  textButton: "MULAI",
                                  navigasi: () {
                                    quizK9a != 0
                                        ? Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  QuizSoalPages(
                                                materi: "kosakata9",
                                                attempt: snapshot.data?[
                                                    "quiz_kosakata9_attempts"],
                                              ),
                                            ),
                                            (route) => false,
                                          )
                                        : ArtSweetAlert.show(
                                            context: context,
                                            artDialogArgs: ArtDialogArgs(
                                              type: ArtSweetAlertType.danger,
                                              title: "Kesempatan Habis !",
                                              text:
                                                  "Sisa percobaan kamu buat mengisi quiz telah dipakai semua",
                                            ),
                                          );
                                  },
                                  color: AppColor.cardgreenlight,
                                ),
                              ],
                            ),
                          ),
                        ],
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
