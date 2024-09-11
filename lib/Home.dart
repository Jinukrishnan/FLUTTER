import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> products = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    final res = await http.get(Uri.parse("https://dummyjson.com/products"));
    print(res.statusCode);
    if (res.statusCode == 200) {
      setState(() {
        products = jsonDecode(res.body)["products"];
        print(products);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            height: 35,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                hintText: "Search",
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        actions: [Icon(Icons.list)],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .6),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/details",
                      arguments: products[index]["id"]);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(.5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                        fit: BoxFit.cover,
                        // color: Colors.red,
                        image: NetworkImage(products[index]['thumbnail']),
                      ),
                      Text(
                        products[index]["category"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        products[index]["title"].length > 20
                            ? products[index]["title"].substring(0, 20) + "..."
                            : products[index]["title"],
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          // percentage
                          Text(
                            "${products[index]["discountPercentage"]} %",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5,
                          ),

                          // normal price

                          // price after offer
                          Text(
                            "${products[index]["price"]} ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      Text("Rating : ${products[index]["rating"]}")
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
