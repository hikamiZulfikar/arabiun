import 'package:project/styles/assets.dart';

class OnboardingModel {
  final String image, title, description;

  OnboardingModel(
      {required this.image, required this.title, required this.description});
}

final List<OnboardingModel> onboarding_data = [
  OnboardingModel(
    image: AppAssets.icWalkthrough1,
    title: 'Selamat Datang di Aplikasi Arabiun',
    description:
        'Aplikasi pembelajaran huruf hijaiyah dan kosakata bahasa arab',
  ),
  OnboardingModel(
    image: AppAssets.icWalkthrough2,
    title: 'Pilih Karakter Favorit Teman-Teman',
    description:
        'Kalian dapat memilih 1 dari 6 karakter hebat sesuai keinginan kalian',
  ),
  OnboardingModel(
    image: AppAssets.icWalkthrough3,
    title: 'Putar Video Pembelajaran Kosakata dan Huruf Hijaiyah',
    description:
        'Kalian dapat memutar video dengan mengklik ikon play',
  ),
  OnboardingModel(
    image: AppAssets.icWalkthrough4,
    title: 'Klik Card untuk Mengeluarkan Suara',
    description:
        'Kalian dapat mendengarkan suara bahasa arab dari kosakata tertentu',
  ),
  OnboardingModel(
    image: AppAssets.icWalkthrough4,
    title: 'Kumpulkan Semua Bintangnya',
    description:
        'Kalian dapat melihat progress dan jumlah bintang dari semua materi',
  ),
];
