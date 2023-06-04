// import 'package:flutter/material.dart';
// import 'package:project/features/materi/huruf_hijaiyah/materi_hijaiyah_pages.dart';

// import 'package:project/styles/color.dart';
// import 'package:project/styles/text_styles.dart';

// import '../../../global_widgets/huruf_hijaiyah_widget.dart';

// class HurufHijaiyahPages extends StatelessWidget {
//   const HurufHijaiyahPages({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: AppColor.blackLight),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const MateriHijaiyahPages()),
//             );
//           },
//         ),
//         title: Text("Materi Huruf Hijaiyah", style: TextStyles.headline4),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: AppColor.primaryLightest,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(6),
//             topRight: Radius.circular(6),
//           ),
//         ),
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20.0,
//             vertical: 10.0,
//           ),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Column(
//                 children: const [
//                   /// Alif
//                   HurufHijaiyahWidget(
//                     huruf: "Alif",
//                     akhir: "ـــا",
//                     tengah: "ــا",
//                     awal: "ا",
//                   ),
//                   SizedBox(height: 12),

//                   /// Ba
//                   HurufHijaiyahWidget(
//                     huruf: "Ba",
//                     akhir: "ـــب",
//                     tengah: "ــــبـــ",
//                     awal: "بـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Ta
//                   HurufHijaiyahWidget(
//                     huruf: "Ta",
//                     akhir: "ـــت",
//                     tengah: "ـــتـــ",
//                     awal: "تـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Tsa
//                   HurufHijaiyahWidget(
//                     huruf: "Tsa",
//                     akhir: "ـــث",
//                     tengah: "ـــثـــ",
//                     awal: "ثــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Jim
//                   HurufHijaiyahWidget(
//                     huruf: "Jim",
//                     akhir: "ـــج",
//                     tengah: "جـ",
//                     awal: "جـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Ha
//                   HurufHijaiyahWidget(
//                     huruf: "Ha",
//                     akhir: "ــح",
//                     tengah: "ــحـ",
//                     awal: "حـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Kho
//                   HurufHijaiyahWidget(
//                     huruf: "Kho",
//                     akhir: "ــخ",
//                     tengah: "ــخـ",
//                     awal: "خـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Dal
//                   HurufHijaiyahWidget(
//                     huruf: "Dal",
//                     akhir: "ــد",
//                     tengah: "ــد",
//                     awal: "د",
//                   ),
//                   SizedBox(height: 12),

//                   /// Dzal
//                   HurufHijaiyahWidget(
//                     huruf: "Dzal",
//                     akhir: "ــذ",
//                     tengah: "ــذ",
//                     awal: "ذ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Ra
//                   HurufHijaiyahWidget(
//                     huruf: "Ra",
//                     akhir: "ــر",
//                     tengah: "ــر",
//                     awal: "ر",
//                   ),
//                   SizedBox(height: 12),

//                   /// Za
//                   HurufHijaiyahWidget(
//                     huruf: "Za",
//                     akhir: "ــز",
//                     tengah: "ـــز",
//                     awal: "ز",
//                   ),
//                   SizedBox(height: 12),

//                   /// Sin
//                   HurufHijaiyahWidget(
//                     huruf: "Sin",
//                     akhir: "ــس",
//                     tengah: "ــســ",
//                     awal: "سـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Syin
//                   HurufHijaiyahWidget(
//                     huruf: "Syin",
//                     akhir: "ــش",
//                     tengah: "ــشــ",
//                     awal: "شـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Shad
//                   HurufHijaiyahWidget(
//                     huruf: "Shad",
//                     akhir: "ــص",
//                     tengah: "ــصــ",
//                     awal: "صــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Dhad
//                   HurufHijaiyahWidget(
//                     huruf: "Dhad",
//                     akhir: "ــض",
//                     tengah: "ــضــ",
//                     awal: "ضــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Tha
//                   HurufHijaiyahWidget(
//                     huruf: "Tha",
//                     akhir: "ــط",
//                     tengah: "ــطــ",
//                     awal: "طــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Zho
//                   HurufHijaiyahWidget(
//                     huruf: "Zho",
//                     akhir: "ــظـ",
//                     tengah: "ــظــ",
//                     awal: "ظــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Ain
//                   HurufHijaiyahWidget(
//                     huruf: "Ain",
//                     akhir: "ــع",
//                     tengah: "ــعــ",
//                     awal: "عــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Ghain
//                   HurufHijaiyahWidget(
//                     huruf: "Ghain",
//                     akhir: "ـــغ",
//                     tengah: "ــغــ",
//                     awal: "غـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Fa
//                   HurufHijaiyahWidget(
//                     huruf: "Fa",
//                     akhir: "ــف",
//                     tengah: "ــفــ",
//                     awal: "فــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Qaf
//                   HurufHijaiyahWidget(
//                     huruf: "Qaf",
//                     akhir: "ــق",
//                     tengah: "ــقــ",
//                     awal: "قــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Kaf
//                   HurufHijaiyahWidget(
//                     huruf: "Kaf",
//                     akhir: "ــك",
//                     tengah: "ــكـ",
//                     awal: "كــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Lam
//                   HurufHijaiyahWidget(
//                     huruf: "Lam",
//                     akhir: "ــل",
//                     tengah: "ــلــ",
//                     awal: "لـ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Min
//                   HurufHijaiyahWidget(
//                     huruf: "Mim",
//                     akhir: "ــم",
//                     tengah: "ــمــ",
//                     awal: "مــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Nun
//                   HurufHijaiyahWidget(
//                     huruf: "Nun",
//                     akhir: "ــن",
//                     tengah: "ــنــ",
//                     awal: "نــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Wau
//                   HurufHijaiyahWidget(
//                     huruf: "Wau",
//                     akhir: "ــو",
//                     tengah: "ــو",
//                     awal: "و",
//                   ),
//                   SizedBox(height: 12),

//                   /// Ha
//                   HurufHijaiyahWidget(
//                     huruf: "Ha",
//                     akhir: "ــه",
//                     tengah: "ــهـ",
//                     awal: "هــ",
//                   ),
//                   SizedBox(height: 12),

//                   /// Hamzah
//                   HurufHijaiyahWidget(
//                     huruf: "Hamzah",
//                     akhir: "ء",
//                     tengah: "ء",
//                     awal: "ء",
//                   ),
//                   SizedBox(height: 12),

//                   /// Ya
//                   HurufHijaiyahWidget(
//                     huruf: "Ya",
//                     akhir: "ــي",
//                     tengah: "ــيـ",
//                     awal: "يـ",
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
