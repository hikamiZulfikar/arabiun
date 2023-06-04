import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/features/profile/widget/card_progress_materi.dart';
import 'package:project/styles/assets.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

class ProgressMateriScreen extends StatefulWidget {
  const ProgressMateriScreen({super.key});

  @override
  State<ProgressMateriScreen> createState() => _ProgressMateriScreenState();
}

class _ProgressMateriScreenState extends State<ProgressMateriScreen> {
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
        title: Text("Profile", style: TextStyles.headline4),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: AppColor.primaryLightest,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Terus asah kemampuan kamu supaya bisa mendapatkan hasil yang maximal",
                style: TextStyles.subtitle2,
              ),
              verticalSizedBox(20.0),
              CardProgressMateri(
                icon: AppAssets.icArabic,
                title: "Huruf Hijaiyah",
                lastClick: 'Alif',
                progress: "hijaiyah",
                total: "30",
                color: AppColor.cardorange,
              ),
              CardProgressMateri(
                icon: AppAssets.icMateri1,
                title: "Karakter Rasulullah",
                lastClick: 'Mandiri',
                progress: "materi_kosakata_karakter_rasulullah",
                total: "6",
                color: AppColor.cardgreen,
              ),
              CardProgressMateri(
                icon: AppAssets.icMateri2,
                title: "Profesi 1",
                lastClick: 'Dokter',
                progress: "materi_kosakata_profesi_1",
                total: "5",
                color: AppColor.cardcokelat,
              ),
              CardProgressMateri(
                icon: AppAssets.icMateri3,
                title: "Kata Benda",
                lastClick: 'Kursi',
                progress: "materi_kosakata_kata_benda",
                total: "5",
                color: AppColor.cardpurple,
              ),
              CardProgressMateri(
                icon: AppAssets.icMateri4,
                title: "Hewan Ternak",
                lastClick: 'Kerbau',
                progress: "materi_kosakata_hewan_ternak",
                total: "6",
                color: AppColor.cardpink,
              ),
              CardProgressMateri(
                icon: AppAssets.icMateri2,
                title: "Profesi 2",
                lastClick: 'Petani Perempuan',
                progress: "materi_kosakata_profesi_2",
                total: "10",
                color: AppColor.cardcokelat,
              ),
              CardProgressMateri(
                icon: AppAssets.icMateri5,
                title: "Muannas & Mudzakkar",
                lastClick: 'Jendela',
                progress: "materi_kosakata_muannas_mudzakar",
                total: "8",
                color: AppColor.cardbluelight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
