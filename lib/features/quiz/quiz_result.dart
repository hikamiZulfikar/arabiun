import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/features/quiz/quiz_soal_pages.dart';
import 'package:project/home_page.dart';
import 'package:project/main.dart';
import 'package:project/styles/button_styles.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage(
      {super.key,
      required this.score,
      required this.materi,
      required this.correctAnswer,
      required this.wrongAnswer,
      required this.attempt});

  final num score, correctAnswer, wrongAnswer, attempt;
  final String materi;

  @override
  Widget build(BuildContext context) {
    String field = "";
    String detail = "";

    if (score >= 70) {
      detail = "Good Job";
    } else {
      detail = "Tingkatkan lagi ya";
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSizedBox(70.0),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Selamat Kamu\nMendapatkan Nilai",
              style: TextStyles.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSizedBox(35.0),
          Container(
            height: 120,
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(200.0),
                border: Border.all(width: 2)),
            child: Text(
              score.toString(),
              style: TextStyles.headline1,
            ),
          ),
          verticalSizedBox(35.0),
          Text(
            detail,
            style: TextStyles.headline4,
          ),
          verticalSizedBox(35.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Benar",
                    style: TextStyles.headline4,
                  ),
                  verticalSizedBox(20.0),
                  Text(
                    correctAnswer.toString(),
                    style: TextStyles.headline4,
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Salah",
                    style: TextStyles.headline4,
                  ),
                  verticalSizedBox(20.0),
                  Text(
                    wrongAnswer.toString(),
                    style: TextStyles.headline4,
                  ),
                ],
              ),
            ],
          ),
          verticalSizedBox(45.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                if (materi == "hijaiyah0") {
                  field = "quiz_hijaiyah0_attempts";
                } else if (materi == "kosakata7") {
                  field = "quiz_kosakata7_attempts";
                } else if (materi == "kosakata9") {
                  field = "quiz_kosakata9_attempts";
                }

                firestore
                    .collection("users")
                    .doc(auth.currentUser!.uid)
                    .update({field: attempt + 1});

                firestore
                    .collection("users")
                    .doc(auth.currentUser!.uid)
                    .collection("quiz_history")
                    .add({
                      'correct': correctAnswer,
                      'wrong': wrongAnswer,
                      'materi': materi,
                      'detail': detail,
                      'score': score,
                      'datetime': FieldValue.serverTimestamp()
                    })
                    .then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(callbackIndex: 1),
                          ),
                          (route) => false),
                    )
                    .catchError(
                      (error) => ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          type: ArtSweetAlertType.danger,
                          title: "Terjadi Kesalahan",
                          text: "Gagal menyimpan hasil quiz",
                        ),
                      ),
                    );
              },
              style: PrimaryButtons.filledButtonStylePrimaryBase,
              child: Text(
                "LANJUT",
                style: TextStyles.button.copyWith(
                  color: AppColor.whiteBase,
                ),
              ),
            ),
          ),
          verticalSizedBox(20.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                if (materi == "hijaiyah0") {
                  field = "quiz_hijaiyah0_attempts";
                } else if (materi == "kosakata7") {
                  field = "quiz_kosakata7_attempts";
                } else if (materi == "kosakata9") {
                  field = "quiz_kosakata9_attempts";
                }

                ArtDialogResponse response = await ArtSweetAlert.show(
                  barrierDismissible: false,
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    denyButtonText: "Engga",
                    title: "Ingin mengulangi quiz?",
                    text: "Kesempatan kamu akan otomatis berkurang...",
                    confirmButtonText: "Iya, Coba lagi",
                    type: ArtSweetAlertType.warning,
                  ),
                );

                if (response.isTapConfirmButton) {
                  if (attempt + 1 < 3) {
                    firestore
                        .collection("users")
                        .doc(auth.currentUser!.uid)
                        .update({field: attempt + 1});

                    firestore
                        .collection("users")
                        .doc(auth.currentUser!.uid)
                        .collection("quiz_history")
                        .add({
                      'correct': correctAnswer,
                      'wrong': wrongAnswer,
                      'materi': materi,
                      'detail': detail,
                      'score': score,
                      'datetime': FieldValue.serverTimestamp()
                    }).then(
                      (value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizSoalPages(
                                materi: materi,
                                attempt: attempt + 1,
                              ),
                            ),
                            (route) => false);
                      },
                    ).catchError(
                      (error) => ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          type: ArtSweetAlertType.danger,
                          title: "Terjadi Kesalahan",
                          text: "Gagal menyimpan hasil quiz",
                        ),
                      ),
                    );
                  } else {
                    ArtSweetAlert.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                        type: ArtSweetAlertType.danger,
                        title: "Kesempatan Habis !",
                        text:
                            "Sisa percobaan kamu buat mengisi quiz telah dipakai semua",
                      ),
                    );
                  }
                } else {
                  return;
                }
              },
              style: SecondaryButtons.outlinedButtonStylePrimaryBase,
              child: Text(
                "ULANGI",
                style: TextStyles.button.copyWith(
                  color: AppColor.primaryBase,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
