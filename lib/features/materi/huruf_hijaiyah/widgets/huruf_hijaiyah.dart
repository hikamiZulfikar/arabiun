import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/loading_widget.dart';
import 'package:project/features/materi/huruf_hijaiyah/pages/huruf_hijaiyah_detail_pages.dart';
import 'package:project/main.dart';
import 'package:project/styles/assets.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

Widget hurufHijaiyah(BuildContext context) {
  final Stream<QuerySnapshot> usersStream = firestore
      .collection('hijaiyah')
      .doc(auth.currentUser!.uid)
      .collection('hijaiyah')
      .orderBy('id')
      .snapshots();

  return StreamBuilder<QuerySnapshot>(
    stream: usersStream,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              await firestore
                  .collection('hijaiyah')
                  .doc(auth.currentUser!.uid)
                  .update({'last_click': AppAssets.huruf[index]["read"]});

              firestore
                  .collection('hijaiyah')
                  .doc(auth.currentUser!.uid)
                  .collection('hijaiyah')
                  .doc((index + 1).toString())
                  .update({'status': true}).then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HurufHijaiyahDetailPages(
                        index: snapshot.data!.docs[index]['id'] - 1),
                  ),
                ).catchError(
                  (error) => ArtSweetAlert.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      type: ArtSweetAlertType.danger,
                      title: "Error !",
                      text: "Terjadi Kesalahan\n $error",
                    ),
                  ),
                ),
              );
            },
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.primaryLighter,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Text(
                        AppAssets.huruf[index]["hijaiyah"],
                        style: TextStyles.headline2,
                      ),
                      Text(
                        AppAssets.huruf[index]["read"],
                        style: TextStyles.subtitle1,
                      ),
                      const Spacer(),
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
  );
}