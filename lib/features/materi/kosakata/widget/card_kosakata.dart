import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/main.dart';
import 'package:project/styles/text_styles.dart';

class CardKosakata extends StatelessWidget {
  final String title;
  final String subtitle;
  final String column;
  final String kelas;
  final String icon;
  final int listLength;
  final Color color;
  final VoidCallback navigasi;

  const CardKosakata({
    super.key,
    required this.title,
    required this.subtitle,
    required this.column,
    required this.icon,
    required this.listLength,
    required this.kelas,
    required this.navigasi,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigasi,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  icon,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyles.headline4),
                      Text(
                        subtitle,
                        style: TextStyles.inter,
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 12.0),
                            padding: const EdgeInsets.symmetric(
                              vertical: 3.0,
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: const Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                            child: Text(
                              kelas,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: firestore
                                .collection(column)
                                .doc(auth.currentUser!.uid)
                                .collection('materi_list').where('status', isEqualTo: true)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return statusText("Error...");
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return statusText("Memuat...");
                              }

                              return statusText(
                                  snapshot.data!.docs.length == listLength
                                      ? "Selesai"
                                      : "Belum Selesai");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSizedBox(20.0),
        ],
      ),
    );
  }

  Widget statusText(String words) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        padding: const EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: const Color.fromRGBO(0, 0, 0, 0.25),
        ),
        child: Text(
          words,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
