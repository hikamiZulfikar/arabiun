import 'package:flutter/material.dart';

import '../styles/assets.dart';
import '../styles/color.dart';
import '../styles/text_styles.dart';

class TestWidget extends StatelessWidget {
  final String huruf;
  final String akhir;
  final String tengah;
  final String awal;
  final VoidCallback suara;

  TestWidget({
    super.key,
    required this.huruf,
    required this.akhir,
    required this.tengah,
    required this.awal,
    required this.suara,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 75,
          height: 80,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Text(
                huruf,
                style: TextStyles.subtitle2,
              ),
              IconButton(
                onPressed: suara, icon: Image.asset(
                AppAssets.icPlay,
                width: 20,
                height: 20,
              ),),
            ],
          ),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: AppColor.testDark,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: AppColor.blackBase,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Text(akhir, style: TextStyles.headline3),
              Text("Akhir", style: TextStyles.subtitle2)
            ],
          ),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: AppColor.testDark,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: AppColor.blackBase,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Text(tengah, style: TextStyles.headline3),
              Text("Tengah", style: TextStyles.subtitle2)
            ],
          ),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: AppColor.testDark,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: AppColor.blackBase,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Text(awal, style: TextStyles.headline3),
              Text("Awal", style: TextStyles.subtitle2)
            ],
          ),
        ),
      ],
    );
  }
}
