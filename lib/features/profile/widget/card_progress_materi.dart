import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/styles/text_styles.dart';

// ignore: must_be_immutable
class CardProgressMateri extends StatefulWidget {
  final String icon;
  final String title;
  String lastClick;
  final String progress;
  final String total;
  final Color color;

  CardProgressMateri({
    super.key,
    required this.icon,
    required this.title,
    required this.lastClick,
    required this.progress,
    required this.total,
    required this.color,
  });

  @override
  State<CardProgressMateri> createState() => _CardProgressMateriState();
}

class _CardProgressMateriState extends State<CardProgressMateri> {
  String docName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    docName = "materi_list";

    if (widget.progress == "hijaiyah") {
      docName = "hijaiyah";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.icon,
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: TextStyles.headline4),
                const SizedBox(height: 8.0),
                FutureBuilder<DocumentSnapshot>(
                  future: firestore
                      .collection(widget.progress.toString())
                      .doc(auth.currentUser!.uid)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    debugPrint(docName);

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Terjadi Kesalahan',
                            style: TextStyles.headline4),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Text('${data['last_click']}',
                          style: TextStyles.body2);
                    }

                    return Text('memuat...', style: TextStyles.body2);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          FutureBuilder<QuerySnapshot>(
            future: firestore
                .collection(widget.progress)
                .doc(auth.currentUser!.uid)
                .collection(docName).where("status", isEqualTo: true)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              String docName = "materi_list";

              if (widget.progress == "hijaiyah") {
                docName = "hijaiyah";
              }

              debugPrint(docName);

              if (snapshot.hasError) {
                return Center(
                  child: Text('Terjadi Kesalahan', style: TextStyles.headline4),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                int count = snapshot.data!.docs.length;

                return Text('${count.toString()}/${widget.total}',
                    style: TextStyles.headline4);
              }

              return Text('-', style: TextStyles.body2);
            },
          ),
          const SizedBox(width: 5.0),
          const Icon(
            Icons.star,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
