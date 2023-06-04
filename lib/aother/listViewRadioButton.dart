import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListViewRadioButton extends StatefulWidget {
  const ListViewRadioButton({super.key});

  @override
  State<ListViewRadioButton> createState() => _ListViewRadioButtonState();
}

class _ListViewRadioButtonState extends State<ListViewRadioButton> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button in Flutter"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "What is your gender?",
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            RadioListTile(
              title: const Text("Male"),
              value: "male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                  debugPrint(value.toString());
                });
              },
            ),
            RadioListTile(
              title: const Text("Female"),
              value: "female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                  debugPrint(value.toString());
                });
              },
            ),
            RadioListTile(
              title: const Text("Other"),
              value: "other",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                  debugPrint(value.toString());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
