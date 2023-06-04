import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class CardNilaiQuiz extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String score;
  final Color color;

  const CardNilaiQuiz({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.subtitle1),
              const SizedBox(height: 8.0),
              Text(subtitle, style: TextStyles.body2),
            ],
          ),
          const Spacer(),
          Text(score, style: TextStyles.headline3),
        ],
      ),
    );
  }
}
