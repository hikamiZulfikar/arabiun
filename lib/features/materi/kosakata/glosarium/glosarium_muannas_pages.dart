import 'package:flutter/material.dart';
import 'package:project/features/materi/kosakata/glosarium/widget/glosarium_muanas.dart';

import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

class GlosariumMuannasPages extends StatelessWidget {
  const GlosariumMuannasPages({super.key});

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
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Text("Laki-laki", style: TextStyles.subtitle2),
          // ),
          const GlosariumMuannas(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
