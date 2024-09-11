import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // String? image = '';
  Map<dynamic, dynamic> product = {};
  Future<void> getProduct(id) async {
    print("hai");
    print(id);
    final res =
        await http.get(Uri.parse("https://dummyjson.com/products/${id}"));
    print(res);
    setState(() {
      product = jsonDecode(res.body);
    });
    print(product["thumbnail"]);
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    if (product.isEmpty) {
      getProduct(id);
      // print(Details);
    }
    // if (image == null) {
    //   setState(() {
    //     image = Details["thumbnail"];
    //   });
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              // child: Text("data"),
              child: Image.network(
                product["thumbnail"].toString(),
                scale: 1,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * .5,
                // fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
