// import 'package:flutter/material.dart';
// import 'package:project/styles/color.dart';

// Widget resource(String type, Map<String, dynamic> resource) {
//     if (type == "text") {
//       response = Container(
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: AppColor.primaryBase,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: AppColor.blackBase,
//             width: 2,
//           ),
//         ),
//         height: 200,
//         child: Center(
//           child: Text(
//             resource["text"],
//             style: TextStyles.headline1,
//           ),
//         ),
//       );
//     } else if (type == "image") {
//       response = Container(
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: AppColor.primaryBase,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: AppColor.blackBase,
//             width: 2,
//           ),
//         ),
//         height: 200,
//         child: Center(
//           child: Column(
//             children: [
//               Image.asset(
//                 resource["resource"],
//                 height: 90,
//                 width: 90,
//               ),
//             ],
//           ),
//         ),
//       );
//     } else if (type == "audio") {
//       response = Container(
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: AppColor.primaryBase,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: AppColor.blackBase,
//             width: 2,
//           ),
//         ),
//         height: 200,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 AppAssets.icPlay,
//                 height: 50,
//                 width: 50,
//               ),
//               verticalSizedBox(20.0),
//               Text(
//                 resource["text"],
//                 style: TextStyles.headline3,
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     return response;
//   }