import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/styles/color.dart';
import '../styles/text_styles.dart';

class HurufHijaiyahWidget extends StatelessWidget {
  final String huruf;
  final String akhir;
  final String tengah;
  final String awal;
  final String dammah;
  final String kasrah;
  final String fathah;

  const HurufHijaiyahWidget({
    super.key,
    required this.huruf,
    required this.akhir,
    required this.tengah,
    required this.awal,
    required this.dammah,
    required this.kasrah,
    required this.fathah,
  });

  @override
  Widget build(BuildContext context) {
    double size = (MediaQuery.of(context).size.width - 48) / 3 - 10;
    return Column(
      children: [
        Text(
          "Penulisan",
          style: TextStyles.headline4,
        ),
        verticalSizedBox(12.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              cardHijaiyah(akhir, "Akhir", size),
              cardHijaiyah(tengah, "Tengah", size),
              cardHijaiyah(awal, "Awal", size),
            ],
          ),
        ),
        verticalSizedBox(20.0),
        Text(
          "Tanda Baca",
          style: TextStyles.headline4,
        ),
        verticalSizedBox(12.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              cardHijaiyah(dammah, "Dammah", size),
              cardHijaiyah(kasrah, "Kasrah", size),
              cardHijaiyah(fathah, "Fathah", size),
            ],
          ),
        ),
      ],
    );
  }

  Widget cardHijaiyah(String arabChar, String subtitle, double size) {
    return Center(
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: AppColor.primaryLighter,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            const Spacer(),
            Text(
              arabChar,
              style: TextStyles.headline2,
            ),
            Text(
              subtitle,
              style: TextStyles.subtitle2,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
