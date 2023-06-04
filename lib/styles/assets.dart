import 'package:project/global_widgets/huruf_hijaiyah_widget.dart';

class AppAssets {
  static const String icPlay = "assets/ic_play.png";
  static const String icNavMateri = "assets/bottom_navigation/navmateriA.png";
  static const String icNavQuiz = "assets/bottom_navigation/navquizA.png";
  static const String icNavProfile = "assets/bottom_navigation/navprofileA.png";
  // static const String icBottomMateri = "assets/ic_bottom_materi.png";
  // static const String icBottomQuiz = "assets/ic_bottom_quiz.png";
  // static const String icBottomProfile = "assets/ic_bottom_profile.png";

  static const String icGlorasirumSupirL =
      "assets/glosarium/profesi_1/ic_glosarium_l_supir.png";
  static const String icGlorasirumPetaniL =
      "assets/glosarium/profesi_1/ic_glosarium_l_petani.png";
  static const String icGlorasirumGuruL =
      "assets/glosarium/profesi_1/ic_glosarium_l_guru.png";
  static const String icGlorasirumDoktorL =
      "assets/glosarium/profesi_1/ic_glosarium_l_doktor.png";
  static const String icGlorasirumPedagangL =
      "assets/glosarium/profesi_1/ic_glosarium_l_pedagang.png";

  static const String icGlorasirumSupirP =
      "assets/glosarium/profesi_2/ic_glosarium_f_supir.png";
  static const String icGlorasirumPetaniP =
      "assets/glosarium/profesi_2/ic_glosarium_f_petani.png";
  static const String icGlorasirumGuruP =
      "assets/glosarium/profesi_2/ic_glosarium_f_guru.png";
  static const String icGlorasirumDoktorP =
      "assets/glosarium/profesi_2/ic_glosarium_f_doktor.png";
  static const String icGlorasirumPedagangP =
      "assets/glosarium/profesi_2/ic_glosarium_f_pedagang.png";

  static const String icNabi =
      "assets/glosarium/sifat_rasul/ic_glosarium_nabi.png";

  static const String icJendela =
      "assets/glosarium/muannas_mudzakkar/ic_glosarium_jendela.png";
  static const String icPenghapus =
      "assets/glosarium/muannas_mudzakkar/ic_glosarium_penghapus.png";
  static const String icSekolah =
      "assets/glosarium/muannas_mudzakkar/ic_glosarium_sekolah.png";

  static const String icMeja =
      "assets/glosarium/kata_benda/ic_glosarium_meja.png";
  static const String icKursi =
      "assets/glosarium/kata_benda/ic_glosarium_kursi.png";
  static const String icPapantulis =
      "assets/glosarium/kata_benda/ic_glosarium_papantulis.png";
  static const String icPulpen =
      "assets/glosarium/kata_benda/ic_glosarium_pulpen.png";
  static const String icBuku =
      "assets/glosarium/kata_benda/ic_glosarium_buku.png";

  static const String icKerbau =
      "assets/glosarium/hewan_ternak/ic_glosarium_kerbau.png";
  static const String icKambing =
      "assets/glosarium/hewan_ternak/ic_glosarium_kambing.png";
  static const String icSapi =
      "assets/glosarium/hewan_ternak/ic_glosarium_sapi.png";
  static const String icAyam =
      "assets/glosarium/hewan_ternak/ic_glosarium_ayam.png";
  static const String icUnta =
      "assets/glosarium/hewan_ternak/ic_glosarium_unta.png";
  static const String icDomba =
      "assets/glosarium/hewan_ternak/ic_glosarium_domba.png";
  // static const String icChicken = "assets/ic_chicken.png";

  static const String icMateri1 = "assets/materi/ic_materi_1.png";
  static const String icMateri2 = "assets/materi/ic_materi_2.png";
  static const String icMateri3 = "assets/materi/ic_materi_3.png";
  static const String icMateri4 = "assets/materi/ic_materi_4.png";
  static const String icMateri5 = "assets/materi/ic_materi_5.png";

  static const String icProfile1 = "assets/icons/ic_profile_1.png";
  static const String icProfile2 = "assets/icons/ic_profile_2.png";

  static const String icArabic = "assets/icons/ic_arabic.png";
  static const String icQuran = "assets/icons/ic_quran.png";
  static const String icGlosarium = "assets/icons/ic_glosarium.png";
  static const String icHijaiyah = "assets/icons/ic_hijaiyah.png";
  static const String ictest = "assets/icons/ic_test.png";
  static const String icLogo = "assets/logo/logo.png";
  static const String icVideo = "assets/icons/ic_vidio.png";
  static const String icTeamwork = "assets/icons/ic_teamwork.png";
  static const String icAudio= "assets/icons/ic_audio.png";

  static const String icAvatar1 = "assets/avatar/avatar1.png";
  static const String icAvatar2 = "assets/avatar/avatar2.png";
  static const String icAvatar3 = "assets/avatar/avatar3.png";
  static const String icAvatar4 = "assets/avatar/avatar4.png";
  static const String icAvatar5 = "assets/avatar/avatar5.png";
  static const String icAvatar6 = "assets/avatar/avatar6.png";

  static const String icWalkthrough1 = "assets/walkthrough/walkthrough1.png";
  static const String icWalkthrough2 = "assets/walkthrough/walkthrough2.png";
  static const String icWalkthrough3 = "assets/walkthrough/walkthrough3.png";
  static const String icWalkthrough4 = "assets/walkthrough/walkthrough4.png";
  static const String icWalkthrough5 = "assets/walkthrough/walkthrough5.png";

// suara
  static const String sdAlif = "suara/alif.wav";
  static const String hjAlif = "alif.mp4";
  static const String github_link = "https://hikamizulfikar.github.io";

  static const List huruf = [
    {
      "id": 1,
      "hijaiyah": "ا",
      "read": "Alif",
      "audio": "hijaiyah/1_alif.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_ALIF.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Alif",
        akhir: "ـــا",
        tengah: "ــا",
        awal: "ا",
        dammah: "اُ",
        kasrah: "اِ",
        fathah: "اَ",
      ),
    },
    {
      "id": 2,
      "hijaiyah": "ب",
      "read": "Ba",
      "audio": "hijaiyah/2_ba.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_BA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Ba",
        akhir: "ـــب",
        tengah: "ــــبـــ",
        awal: "بـ",
        dammah: "بُ",
        kasrah: "بِ",
        fathah: "بَ",
      ),
    },
    {
      "id": 3,
      "hijaiyah": "ت",
      "read": "Ta",
      "audio": "hijaiyah/3_ta.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_TA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Ta",
        akhir: "ـــت",
        tengah: "ـــتـــ",
        awal: "تـ",
        dammah: "تُ",
        kasrah: "تِ",
        fathah: "تَ",
      ),
    },
    {
      "id": 4,
      "hijaiyah": "ث",
      "read": "Tsa",
      "audio": "hijaiyah/4_tsa.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_TSA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Tsa",
        akhir: "ـــث",
        tengah: "ـــثـــ",
        awal: "ثــ",
        dammah: "ثُ",
        kasrah: "ثِ",
        fathah: "ثَ",
      ),
    },
    {
      "id": 5,
      "hijaiyah": "ج",
      "read": "Jim",
      "audio": "hijaiyah/5_jim.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_JIM.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Jim",
        akhir: "ـــج",
        tengah: "جـ",
        awal: "جـ",
        dammah: "جُ",
        kasrah: "جِ",
        fathah: "جَ",
      ),
    },
    {
      "id": 6,
      "hijaiyah": "ح",
      "read": "Ha",
      "audio": "hijaiyah/6_ha.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_HA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Ha",
        akhir: "ــح",
        tengah: "ــحـ",
        awal: "حـ",
        dammah: "حُ",
        kasrah: "حِ",
        fathah: "حَ",
      ),
    },
    {
      "id": 7,
      "hijaiyah": "خ",
      "read": "Kho",
      "audio": "hijaiyah/7_kho.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_KHO.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Kho",
        akhir: "ــخ",
        tengah: "ــخـ",
        awal: "خـ",
        dammah: "خُ",
        kasrah: "خِ",
        fathah: "خَ",
      ),
    },
    {
      "id": 8,
      "hijaiyah": "د",
      "read": "Dal",
      "audio": "hijaiyah/8_dal.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_DAL.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Dal",
        akhir: "ــد",
        tengah: "ــد",
        awal: "د",
        dammah: "دٌ",
        kasrah: "دِ",
        fathah: "دَ",
      ),
    },
    {
      "id": 9,
      "hijaiyah": "ذ",
      "read": "Dzal",
      "audio": "hijaiyah/9_dzal.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_DZAL.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Dzal",
        akhir: "ــذ",
        tengah: "ــذ",
        awal: "ذ",
        dammah: "ذُ",
        kasrah: "ذِ",
        fathah: "ذَ",
      ),
    },
    {
      "id": 10,
      "hijaiyah": "ر",
      "read": "Ra",
      "audio": "hijaiyah/10_ra.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_RA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Ra",
        akhir: "ــر",
        tengah: "ــر",
        awal: "ر",
        dammah: "رُ",
        kasrah: "رِ",
        fathah: "رَ",
      ),
    },
    {
      "id": 11,
      "hijaiyah": "ز",
      "read": "Za",
      "audio": "hijaiyah/11_za.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_ZA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Za",
        akhir: "ــز",
        tengah: "ـــز",
        awal: "ز",
        dammah: "زُ",
        kasrah: "زِ",
        fathah: "زَ",
      ),
    },
    {
      "id": 12,
      "hijaiyah": "س",
      "read": "Sin",
      "audio": "hijaiyah/12_sin.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_SIN.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Sin",
        akhir: "ــس",
        tengah: "ــســ",
        awal: "سـ",
        dammah: "سُ",
        kasrah: "سِ",
        fathah: "سَ",
      ),
    },
    {
      "id": 13,
      "hijaiyah": "ش",
      "read": "Syin",
      "audio": "hijaiyah/13_syin.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_SYIN.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Syin",
        akhir: "ــش",
        tengah: "ــشــ",
        awal: "شـ",
        dammah: "شُ",
        kasrah: "شِ",
        fathah: "شَ",
      ),
    },
    {
      "id": 14,
      "hijaiyah": "ص",
      "read": "Shad",
      "audio": "hijaiyah/14_shad.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_SHAD.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Shad",
        akhir: "ــص",
        tengah: "ــصــ",
        awal: "صــ",
        dammah: "صُ",
        kasrah: "صِ",
        fathah: "صَ",
      ),
    },
    {
      "id": 15,
      "hijaiyah": "ض",
      "read": "Dhad",
      "audio": "hijaiyah/15_dhad.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_DHAD.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Dhad",
        akhir: "ــض",
        tengah: "ــضــ",
        awal: "ضــ",
        dammah: "ضُ",
        kasrah: "ضِ",
        fathah: "ضَ",
      ),
    },
    {
      "id": 16,
      "hijaiyah": "ط",
      "read": "Tha",
      "audio": "hijaiyah/16_tha.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_THA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Tha",
        akhir: "ــط",
        tengah: "ــطــ",
        awal: "طــ",
        dammah: "طُ",
        kasrah: "طِ",
        fathah: "طَ",
      ),
    },
    {
      "id": 17,
      "hijaiyah": "ظ",
      "read": "Zho",
      "audio": "hijaiyah/17_zho.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_ZO.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Zho",
        akhir: "ــظـ",
        tengah: "ــظــ",
        awal: "ظــ",
        dammah: "ظُ",
        kasrah: "ظِ",
        fathah: "ظَ",
      ),
    },
    {
      "id": 18,
      "hijaiyah": "ع",
      "read": "'Ain",
      "audio": "hijaiyah/18_ain.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_AIN.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Ain",
        akhir: "ــع",
        tengah: "ــعــ",
        awal: "عــ",
        dammah: "عُ",
        kasrah: "عِ",
        fathah: "عَ",
      ),
    },
    {
      "id": 19,
      "hijaiyah": "غ",
      "read": "Ghain",
      "audio": "hijaiyah/19_ghain.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_GHAIN.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Ghain",
        akhir: "ـــغ",
        tengah: "ــغــ",
        awal: "غـ",
        dammah: "غُ",
        kasrah: "غِ",
        fathah: "غَ",
      ),
    },
    {
      "id": 20,
      "hijaiyah": "ف",
      "read": "Fa",
      "audio": "hijaiyah/20_fa.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_FA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Fa",
        akhir: "ــف",
        tengah: "ــفــ",
        awal: "فــ",
        dammah: "فُ",
        kasrah: "فِ",
        fathah: "فَ",
      ),
    },
    {
      "id": 21,
      "hijaiyah": "ق",
      "read": "Qaf",
      "audio": "hijaiyah/21_qaf.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_QAF.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Qaf",
        akhir: "ــق",
        tengah: "ــقــ",
        awal: "قــ",
        dammah: "قُ",
        kasrah: "قِ",
        fathah: "قَ",
      ),
    },
    {
      "id": 22,
      "hijaiyah": "ك",
      "read": "Kaf",
      "audio": "hijaiyah/22_kaf.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_KAF.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Kaf",
        akhir: "ــك",
        tengah: "ــكـ",
        awal: "كــ",
        dammah: "كُ",
        kasrah: "كِ",
        fathah: "كَ",
      ),
    },
    {
      "id": 23,
      "hijaiyah": "ل",
      "read": "Lam",
      "audio": "hijaiyah/23_lam.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_LAM.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Lam",
        akhir: "ــل",
        tengah: "ــلــ",
        awal: "لـ",
        dammah: "لُ",
        kasrah: "لِ",
        fathah: "لَ",
      ),
    },
    {
      "id": 24,
      "hijaiyah": "م",
      "read": "Mim",
      "audio": "hijaiyah/24_mim.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_MIM.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Mim",
        akhir: "ــم",
        tengah: "ــمــ",
        awal: "مــ",
        dammah: "مُ",
        kasrah: "مِ",
        fathah: "مَ",
      ),
    },
    {
      "id": 25,
      "hijaiyah": "ن",
      "read": "Nun",
      "audio": "hijaiyah/25_nun.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_NUN.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Nun",
        akhir: "ــن",
        tengah: "ــنــ",
        awal: "نــ",
        dammah: "نُ",
        kasrah: "نِ",
        fathah: "نَ",
      ),
    },
    {
      "id": 26,
      "hijaiyah": "و",
      "read": "Wau",
      "audio": "hijaiyah/26_wau.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_WAU.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Wau",
        akhir: "ــو",
        tengah: "ــو",
        awal: "و",
        dammah: "وُ",
        kasrah: "وِ",
        fathah: "وَ",
      ),
    },
    {
      "id": 27,
      "hijaiyah": "ه",
      "read": "Ha",
      "audio": "hijaiyah/27_ha.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_HA2.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Ha",
        akhir: "ــه",
        tengah: "ــهـ",
        awal: "هــ",
        dammah: "هُ",
        kasrah: "هِ",
        fathah: "هَ",
      ),
    },
    {
      "id": 28,
      "hijaiyah": "لا",
      "read": "Lam alif",
      "audio": "hijaiyah/28_lamalif.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_LAM_ALIF.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Lam alif",
        akhir: "ــلا",
        tengah: "ــلا",
        awal: "لا",
        dammah: "لاُ",
        kasrah: "لاِ",
        fathah: "لاَ",
      ),
    },
    {
      "id": 29,
      "hijaiyah": "ء",
      "read": "Hamzah",
      "audio": "hijaiyah/29_hamzah.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_HAMZAH.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Hamzah",
        akhir: "ء",
        tengah: "ء",
        awal: "ء",
        dammah: "ءُ",
        kasrah: "ءِ",
        fathah: "ءَ",
      ),
    },
    {
      "id": 30,
      "hijaiyah": "ى",
      "read": "Ya",
      "audio": "hijaiyah/30_ya.mp3",
      "video": "$github_link/video_materi/HURUF_HIJAIYAH_YA.mp4",
      "attribut": HurufHijaiyahWidget(
        huruf: "Ya",
        akhir: "ــي",
        tengah: "ــيـ",
        awal: "يـ",
        dammah: "يُ",
        kasrah: "يِ",
        fathah: "يَ",
      ),
    },
  ];
}
