// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:project/aother/listViewCounterItem.dart';

class ListViewCounter extends StatelessWidget {
  const ListViewCounter({super.key});

  @override
  Widget build(BuildContext context) {
    List product = [
      {
        "picture": "assets/ic_play.png",
        "name": "Product 1",
        "price": 12000,
      },
      {
        "picture": "assets/ic_play.png",
        "name": "Product 2",
        "price": 15000,
      },
      {
        "picture": "assets/ic_play.png",
        "name": "Product 3",
        "price": 10000,
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button in Flutter"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: product.length,
        itemBuilder: (BuildContext context, int index) {
          var productItem = product[index];
          return ListViewCounterItem(productItem: productItem);
        },
      ),
    );
  }
}
