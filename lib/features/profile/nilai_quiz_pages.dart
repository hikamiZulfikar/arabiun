import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/main.dart';
import 'package:project/styles/assets.dart';

import '../../styles/color.dart';
import '../../styles/text_styles.dart';
import '../../global_widgets/card_nilai_quiz_widget.dart';

class NilaiQuizPages extends StatelessWidget {
  const NilaiQuizPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.blackLight),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Profile", style: TextStyles.headline4),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: AppColor.primaryLightest,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Terus asah kemampuan kamu supaya bisa mendapatkan hasil yang maximal",
                style: TextStyles.subtitle2,
              ),
              verticalSizedBox(20.0),
              FutureBuilder<QuerySnapshot>(
                future: firestore
                    .collection("users")
                    .doc(auth.currentUser!.uid)
                    .collection("quiz_history").orderBy('datetime', descending: true)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Terjadi Kesalahan',
                        style: TextStyles.headline4,
                      ),
                    );
                  }
        
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50.0,
                        color: AppColor.primaryBase,
                      ),
                    );
                  }
        
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map(
                      (DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
        
                        num score = data['score'];
                        String materi = data['materi'];
                        String detail = data['detail'];
        
                        Color cardColor = AppColor.cardorange;
                        String icon = AppAssets.icQuran;
        
                        if (materi == "hijaiyah0") {
                          materi = "Huruf Hijaiyah";
                          cardColor = AppColor.cardorange;
                          icon = AppAssets.icArabic;
                        } else if (materi == "kosakata7") {
                          materi = "Kosakata Kelas 7";
                          cardColor = AppColor.cardgreenlight;
                        } else if (materi == "kosakata9") {
                          materi = "Kosakata Kelas 9";
                          cardColor = AppColor.cardgreenlight;
                        }
        
                        return CardNilaiQuiz(
                          icon: icon,
                          title: materi,
                          subtitle: detail,
                          score: score.toString(),
                          color: cardColor,
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
