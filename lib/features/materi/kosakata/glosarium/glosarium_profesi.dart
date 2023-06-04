import 'package:flutter/material.dart';
import 'package:project/features/materi/kosakata/glosarium/widget/glosarium_profesi.dart';

import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

class GlosariumProfesiPages extends StatelessWidget {
  const GlosariumProfesiPages({super.key});

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
          ),
          GlosariumProfesi(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
