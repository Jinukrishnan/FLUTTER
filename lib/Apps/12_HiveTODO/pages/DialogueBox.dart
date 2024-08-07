import 'package:apps/Apps/12_HiveTODO/pages/Buttons.dart';
import 'package:apps/Apps/5_Calculator/Buttons.dart';
import 'package:flutter/material.dart';

class DialogueBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final controller;
  DialogueBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Create New Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(text: "Save", onPressed: onSave),
                SizedBox(
                  width: 10,
                ),
                MyButtons(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
