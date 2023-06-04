import 'package:project/features/materi/kosakata/glosarium/glosarium_benda_pages.dart';
import 'package:project/features/materi/kosakata/glosarium/glosarium_hewan_pages.dart';
import 'package:project/features/materi/kosakata/glosarium/glosarium_muannas_pages.dart';
import 'package:project/features/materi/kosakata/glosarium/glosarium_profesi.dart';
import 'package:project/features/materi/kosakata/glosarium/glosarium_profesi_2_pages.dart';
import 'package:project/features/materi/kosakata/glosarium/glosarium_sifat_nabi_pages.dart';
import 'package:project/features/materi/kosakata/glosarium/model/hewan_ternak_list.dart';
import 'package:project/features/materi/kosakata/glosarium/model/karakter_rasulullah_list.dart';
import 'package:project/features/materi/kosakata/glosarium/model/kata_benda_list.dart';
import 'package:project/features/materi/kosakata/glosarium/model/muannas_mudzakkar_list.dart';
import 'package:project/features/materi/kosakata/glosarium/model/profesi_1_list.dart';
import 'package:project/features/materi/kosakata/glosarium/model/profesi_2._list.dart';
import 'package:project/styles/assets.dart';
import 'package:project/styles/color.dart';

class MateriList {
  static List materiList = [
    {
      "firestore_col": "materi_kosakata_karakter_rasulullah",
      "title": "Karakter Rasulullah",
      "subtitle": "Ayo belajar sambil lebih mengenal Rasulullah Saw",
      "icons": AppAssets.icMateri1,
      "class": "Kelas 7",
      "status": "Belum",
      "navigation": GlosariumSifatNabiPages(),
      "card_color": AppColor.cardgreen,
      "listLength": MateriRasulullah.listMaterisifatnabi[0]['total_materi']
    },
    {
      "firestore_col": "materi_kosakata_profesi_1",
      "title": "Profesi 1",
      "subtitle": "Yuk mengenal berbagai profesi dalam Bahasa Arab.",
      "icons": AppAssets.icMateri2,
      "class": "Kelas 7",
      "status": "Selesai",
      "navigation": GlosariumProfesiPages(),
      "card_color": AppColor.cardcokelat,
      "listLength": ProfesiSatuMateri.listMateriProfesi1[0]['total_materi']
    },
    {
      "firestore_col": "materi_kosakata_kata_benda",
      "title": "Kata Benda",
      "subtitle": "Ada banyak nama benda yang ada disekolah",
      "icons": AppAssets.icMateri3,
      "class": "Kelas 7",
      "status": "Selesai",
      "navigation": GlosariumBendaPages(),
      "card_color": AppColor.cardpurple,
      "listLength": MateriKataBenda.listMateriKataBenda[0]['total_materi']
    },
    {
      "firestore_col": "materi_kosakata_hewan_ternak",
      "title": "Hewan Ternak",
      "subtitle": "Hmm hewan apa saja ya yang boleh disembelih?",
      "icons": AppAssets.icMateri4,
      "class": "Kelas 9",
      "status": "Selesai",
      "navigation": GlosariumHewanPages(),
      "card_color": AppColor.cardpink,
      "listLength": MateriHewanTernak.listMateriHewanTernak[0]['total_materi']
    },
    {
      "firestore_col": "materi_kosakata_profesi_2",
      "title": "Profesi 2",
      "subtitle": "Yuk mengenal berbagai profesi dalam Bahasa Arab.",
      "icons": AppAssets.icMateri2,
      "class": "Kelas 9",
      "status": "Selesai",
      "navigation": GlosariumProfesi2Pages(),
      "card_color": AppColor.cardcokelat,
      "listLength": ProfesiDuaMateri.listMateriProfesi2[0]['total_materi']
    },
    {
      "firestore_col": "materi_kosakata_muannas_mudzakar",
      "title": "Muannas & Mudzakkar",
      "subtitle": "Ada banyak nama benda yang ada disekolah",
      "icons": AppAssets.icMateri5,
      "class": "Kelas 7",
      "status": "Selesai",
      "navigation": GlosariumMuannasPages(),
      "card_color": AppColor.cardbluelight,
      "listLength": MateriMuannasMudzakkar.listMateriMuannasMudzakkar[0]['total_materi']
    }
  ];
}
