import 'package:flutter/material.dart';
import 'package:project/aother/currencyFormat.dart';

class ListViewCounterItem extends StatefulWidget {
  final Map<String, dynamic> productItem;
  const ListViewCounterItem({super.key, required this.productItem});

  @override
  State<ListViewCounterItem> createState() => _ListViewCounterItemState();
}

class _ListViewCounterItemState extends State<ListViewCounterItem> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.productItem["picture"],
            height: 48,
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productItem["name"],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                CurrencyFormat.convertToIdr(widget.productItem["price"], 0),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              setState(() {
                if (quantity > 0) {
                  quantity--;
                }
              });
            },
            icon: const Icon(Icons.remove_circle_outline),
          ),
          SizedBox(
            width: 24.0,
            child: Center(
              child: Text(
                quantity.toString(),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }
}
