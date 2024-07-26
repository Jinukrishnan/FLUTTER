import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: TextField(
              // 1-functionality
              keyboardType: TextInputType.multiline,
              onChanged: (String textValue) {
                print(textValue);
              },
              onTap: () {
                print("tap on text fields");
              },
              enabled: true,
              // maxLines: 4,
              // controller: TextEditingController(text: "default value"),

              // 2-styling
              decoration: InputDecoration(
                // a-enabled border
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                // =============================================
                // b-disbled border
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                // ===============================================
                // c-focused border
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                // ======================================================
                // d-icon
                icon: Icon(
                  Icons.more,
                  color: Colors.green,
                ),
                suffixIcon: Icon(
                  Icons.account_box,
                  color: Colors.green,
                ),
                // suffixText: "ok",
                // suffix: OutlinedButton(
                //   onPressed: () {
                //     print("object");
                //   },
                //   child: Text("Click"),
                // ),

                // Padding
                contentPadding: EdgeInsets.all(20),
                labelText: "label text",
                labelStyle: TextStyle(color: Colors.red),
                hintText: "hint text",
                helperText: "helper text",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
