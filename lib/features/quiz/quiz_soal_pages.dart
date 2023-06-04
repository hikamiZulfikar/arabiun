// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/features/quiz/questions/quiz_hijaiyah_questions.dart';
import 'package:project/features/quiz/questions/quiz_kosakata7_questions.dart';
import 'package:project/features/quiz/questions/quiz_kosakata9_questions.dart';
import 'package:project/features/quiz/quiz_result.dart';
import 'package:project/global_widgets/exit_dialog.dart';

import 'package:project/styles/assets.dart';
import 'package:project/styles/button_styles.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

class QuizSoalPages extends StatefulWidget {
  const QuizSoalPages({
    Key? key,
    required this.materi,
    required this.attempt,
  }) : super(key: key);

  final String materi;
  final num attempt;

  @override
  State<QuizSoalPages> createState() => _QuizSoalPagesState();
}

class _QuizSoalPagesState extends State<QuizSoalPages> {
  int index = 0;
  int selectedAnswer = 0;
  num finalScore = 0;
  num correctAnswer = 0;
  num wrongAnswer = 0;

  late Widget response;

  final audioPlayer = AudioPlayer();
  List questions = [];

  @override
  void initState() {
    super.initState();
    if (widget.materi == "hijaiyah0") {
      // questions = QuizHijaiyahQuestions.questions.toList();
      questions = QuizHijaiyahQuestions.questions;
    } else if (widget.materi == "kosakata7") {
      // questions = QuizKosakata7Questions.questions.toList();
      questions = QuizKosakata7Questions.questions;
    } else if (widget.materi == "kosakata9") {
      // questions = QuizKosakata9Questions.questions.toList();
      questions = QuizKosakata9Questions.questions;
    }

    for (int i = 0; i < questions.length; i++) {
      questions[i]['user_answer'] = 0;
    }

    debugPrint(questions.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Soal ${questions[index]["id"].toString()}",
              style: TextStyles.headline4),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSizedBox(20.0),
                      resource(questions[index]["media_type"],
                          questions[index]["media"]),
                      verticalSizedBox(20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          questions[index]["question"],
                          style: TextStyles.body1,
                        ),
                      ),
                      verticalSizedBox(20.0),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: questions[index]["answers"].length,
                        itemBuilder: (BuildContext context, int i) => Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAnswer = questions[index]["answers"]
                                      [i]["id_answer"];
                                  if (selectedAnswer ==
                                      questions[index]["answer"]) {
                                    questions[index]["score"] = 10;
                                    questions[index]["user_answer"] =
                                        selectedAnswer;
                                  } else {
                                    questions[index]["score"] = 0;
                                    questions[index]["user_answer"] =
                                        selectedAnswer;
                                  }
                                  debugPrint(selectedAnswer.toString());
                                  debugPrint(
                                      questions[index]["score"].toString());
                                });
                              },
                              child: Container(
                                padding:
                                    questions[index]["answer_type"] == "indo"
                                        ? const EdgeInsets.all(20.0)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 7.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: selectedAnswer ==
                                          questions[index]["answers"][i]
                                              ["id_answer"]
                                      ? Colors.lightGreen
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    width: 2,
                                    color: selectedAnswer ==
                                            questions[index]["answers"][i]
                                                ["id_answer"]
                                        ? Colors.green
                                        : Colors.black,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 30.0,
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColor.blackBase,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          questions[index]["answers"][i]
                                              ["options"],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    Flexible(
                                      child: Container(
                                        alignment: questions[index]
                                                    ["answer_type"] ==
                                                "indo"
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Text(
                                          questions[index]["answers"][i]
                                              ["text"],
                                          style: questions[index]
                                                      ["answer_type"] ==
                                                  "indo"
                                              ? TextStyles.headline4
                                              : TextStyles.headline2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              style: index == 0
                                  ? PrimaryButtons.filledButtonStyleWhiteDarkest
                                  : PrimaryButtons.filledButtonStylePrimaryBase,
                              onPressed: () {
                                if (index > 0) {
                                  setState(() {
                                    index -= 1;
                                    selectedAnswer =
                                        questions[index]["user_answer"];
                                    debugPrint(selectedAnswer.toString());
                                  });
                                }
                              },
                              child: const Text("KEMBALI"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              style:
                                  PrimaryButtons.filledButtonStylePrimaryBase,
                              onPressed: () async {
                                if (index < 9) {
                                  setState(() {
                                    index += 1;
                                    selectedAnswer =
                                        questions[index]["user_answer"];
                                  });
                                } else {
                                  ArtDialogResponse response =
                                      await ArtSweetAlert.show(
                                    barrierDismissible: false,
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      denyButtonText: "Engga",
                                      title: "Kirim Jawaban Kamu?",
                                      text:
                                          "Kamu tidak bisa ngubah jawaban kamu lagi..",
                                      confirmButtonText: "Iya, Kirimkan",
                                      type: ArtSweetAlertType.warning,
                                    ),
                                  );

                                  if (response.isTapConfirmButton) {
                                    for (var i = 0; i < questions.length; i++) {
                                      finalScore += questions[i]["score"];

                                      if (questions[i]["user_answer"] ==
                                          questions[i]["answer"]) {
                                        correctAnswer += 1;
                                      } else {
                                        wrongAnswer += 1;
                                      }
                                    }

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QuizResultPage(
                                            score: finalScore,
                                            correctAnswer: correctAnswer,
                                            wrongAnswer: wrongAnswer,
                                            attempt: widget.attempt,
                                            materi: widget.materi,
                                          ),
                                        ),
                                        (route) => false);
                                  } else {
                                    return;
                                  }
                                }
                              },
                              child: Text(index == 9 ? "SELESAI" : "LANJUT"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget resource(String type, Map<String, dynamic> resource) {
    if (type == "text") {
      response = Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.primaryBase,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColor.blackBase,
            width: 2,
          ),
        ),
        height: 200,
        child: Center(
          child: Text(
            resource["text"],
            style: TextStyles.headline1,
          ),
        ),
      );
    } else if (type == "image") {
      response = Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.primaryBase,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColor.blackBase,
            width: 2,
          ),
        ),
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              resource["resource"],
              height: 90,
              width: 90,
            ),
            const Spacer(),
          ],
        ),
      );
    } else if (type == "audio") {
      response = Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.primaryBase,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColor.blackBase,
            width: 2,
          ),
        ),
        height: 200,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  audioPlayer.play(AssetSource(resource["resource"]));
                },
                child: Image.asset(
                  AppAssets.icPlay,
                  height: 50,
                  width: 50,
                ),
              ),
              verticalSizedBox(20.0),
              Text(
                resource["text"],
                style: TextStyles.headline3,
              ),
            ],
          ),
        ),
      );
    }
    return response;
  }
}
