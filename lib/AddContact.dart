import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();


  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_picker != null) {
      setState(() {
        _image = File(pickedFile!.path);
      });
    }
  }



  Future<void> _saveData() async{

    final prefs = await SharedPreferences.getInstance();
    final res=prefs.getString("contacts");
    final bytes = await _image!.readAsBytes();
    final base64Image = base64Encode(bytes);

    if(res!=null){
      List<dynamic> contacts= json.decode(res);
      contacts.add({"fname":_fname.text,"lname":_lname.text,"email":_email.text,"phone":_phone.text,"profile":base64Image});
      prefs.setString("contacts", jsonEncode(contacts));
      print("added");
      Navigator.pushNamed(context, '/home');
      final asd=prefs.getString("contacts");
      print(asd);

    }
    else{
      List<dynamic> contacts=[{"fname":_fname.text,"lname":_lname.text,"email":_email.text,"phone":_phone.text,"profile":base64Image}];
      prefs.setString("contacts", jsonEncode(contacts));
      Navigator.pushNamed(context, '/home');

    }

    // await prefs.setString("userImage", base64Image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Contact")),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text(
                            "No image",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
              ),
            ),
            TextButton(
              onPressed: _pickImage,
              child: Text("Pick Image"),
            ),
            Divider(),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _fname,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "FirstName",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _lname,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _phone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: _saveData,
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Rounded corners
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
