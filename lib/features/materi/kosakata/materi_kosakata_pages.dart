import 'package:flutter/material.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/features/materi/kosakata/model/materi_list.dart';
import 'package:project/features/materi/kosakata/widget/card_kosakata.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

class MateriKosakataPages extends StatefulWidget {
  const MateriKosakataPages({super.key});

  @override
  State<MateriKosakataPages> createState() => _MateriKosakataPagesState();
}

class _MateriKosakataPagesState extends State<MateriKosakataPages> {
  final searchController = TextEditingController();
  late List items;

  @override
  void initState() {
    super.initState();
    items = MateriList.materiList;
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = MateriList.materiList
          .where((item) =>
              item["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
      body: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: AppColor.primaryLightest,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColor.whiteDark,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.whiteDarkest),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Mau belajar apa hari ini .....",
                      hintStyle: TextStyles.body2,
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                verticalSizedBox(20.0),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    debugPrint(items[index]['firestore_col']);
                    return CardKosakata(
                      title: items[index]["title"],
                      subtitle: items[index]["subtitle"],
                      column: items[index]['firestore_col'],
                      icon: items[index]["icons"],
                      kelas: items[index]["class"],
                      listLength: items[index]['listLength'],
                      navigasi: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => items[index]["navigation"],
                          ),
                        );
                      },
                      color: items[index]["card_color"],
                    );

                    // return CardKosakata(
                    //   title: items[index]["title"],
                    //   subtitle: items[index]["subtitle"],
                    //   status: items[index]["status"],
                    //   icon: items[index]["icons"],
                    //   kelas: items[index]["class"],
                    //   navigasi: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => items[index]["navigation"],
                    //       ),
                    //     );
                    //   },
                    //   color: items[index]["card_color"],
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
