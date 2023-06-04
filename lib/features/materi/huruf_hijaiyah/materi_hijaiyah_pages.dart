import 'package:flutter/material.dart';
import 'package:project/features/materi/huruf_hijaiyah/widgets/huruf_hijaiyah.dart';

import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

class MateriHijaiyahPages extends StatefulWidget {
  const MateriHijaiyahPages({super.key});

  @override
  State<MateriHijaiyahPages> createState() => _MateriHijaiyahPagesState();
}

class _MateriHijaiyahPagesState extends State<MateriHijaiyahPages> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        title: Text("Materi", style: TextStyles.headline4),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
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
                  "Materi Huruf Hijaiyah",
                  style: TextStyles.headline4,
                ),
                const SizedBox(height: 20.0),
                hurufHijaiyah(context),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
