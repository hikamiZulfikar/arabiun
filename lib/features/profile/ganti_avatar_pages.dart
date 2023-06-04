// ignore_for_file: must_be_immutable

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:project/features/profile/avatar_list.dart';
import 'package:project/home_page.dart';
import 'package:project/main.dart';
import 'package:project/styles/button_styles.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

typedef StringValue = String Function(String);

class GantiAvatarPages extends StatefulWidget {
  GantiAvatarPages({Key? key, required this.from}) : super(key: key);

  String from;

  @override
  _GantiAvatarPagesState createState() => _GantiAvatarPagesState();
}

class _GantiAvatarPagesState extends State<GantiAvatarPages> {
  late String avatarSelected;
  late int selectedId;

  @override
  void initState() {
    super.initState();
    avatarSelected = "";
    selectedId = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: widget.from == "profile" ? IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.blackLight),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ) : null,
        title: Text("Ganti Karakter", style: TextStyles.headline4),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Karakter Kamu",
                  style: TextStyles.headline4,
                ),
                const SizedBox(height: 12.0),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: List.generate(
                    AvatarList.avatarList.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedId = AvatarList.avatarList[index]["id"];
                            avatarSelected =
                                AvatarList.avatarList[index]["value"];
                            debugPrint(avatarSelected);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      AvatarList.avatarList[index]["resource"],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20.0,
                                right: 20.0,
                                child: Icon(
                                  Icons.circle,
                                  color: selectedId ==
                                          AvatarList.avatarList[index]["id"]
                                      ? Colors.green
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    style: PrimaryButtons.filledButtonStylePrimaryBase,
                    onPressed: () {
                      avatarSelected.isNotEmpty
                          ? firestore
                              .collection("users")
                              .doc(auth.currentUser!.uid)
                              .update({"avatar": avatarSelected})
                              .then(
                                (value) => widget.from == "profile"
                                    ? Navigator.of(context).pop()
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(
                                            callbackIndex: 0,
                                          ),
                                        ),
                                      ),
                              )
                              .catchError(
                                (error) => ArtSweetAlert.show(
                                  context: context,
                                  artDialogArgs: ArtDialogArgs(
                                    type: ArtSweetAlertType.danger,
                                    title: "Gagal Mengupdate Avatar",
                                    text: "Terjadi Kesalahan\n $error",
                                  ),
                                ),
                              )
                          : ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                type: ArtSweetAlertType.warning,
                                title: "Katakter Belum Dipilih !",
                                text: "Silahkan pilih karakter kamu dulu",
                              ),
                            );
                    },
                    child: const Text("PILIH KARAKTER"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Ganti Avatar", style: TextStyles.headline4),
    //     backgroundColor: Colors.white,
    //     leading: IconButton(
    //       icon: const Icon(Icons.arrow_back, color: AppColor.blackLight),
    //       onPressed: () {
    //         Navigator.of(context).pop();
    //       },
    //     ),
    //     elevation: 0,
    //   ),
    //   body: Stack(
    //     children: [
    //       SingleChildScrollView(
    //         child: Container(
    //           color: Colors.white,
    //           padding: const EdgeInsets.all(20.0),
    //           child: Column(
    //             children: [
    //               const SizedBox(height: 20.0),
    //               Text(
    //                 "Pilih Karakter Kamu",
    //                 style: TextStyles.headline4,
    //               ),
    //               const SizedBox(height: 20.0),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         bottom: 0,
    // child:
    //       )
    //     ],
    //   ),
    // );
  }
}
