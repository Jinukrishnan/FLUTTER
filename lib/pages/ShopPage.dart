import 'package:cofeeshope/components/cofee_tile.dart';
import 'package:cofeeshope/models/cofee.dart';
import 'package:cofeeshope/models/cofee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add to cart
  void addToCart(Cofee cofee) {
    Provider.of<CofeeShop>(context, listen: false).addItemToCart(cofee);
// let user know it add been successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("successfulyy added to cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CofeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // heading mesaage
              Text(
                "How wold you like your coffee  ",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              // list of cofee buy
              Expanded(
                  child: ListView.builder(
                      itemCount: value.cofeeShop.length,
                      itemBuilder: (context, index) {
                        // get individual cofee
                        Cofee eachCofee = value.cofeeShop[index];

                        // return the tile for coffee
                        return CofeeTile(
                          cofee: eachCofee,
                          onPressed: () => addToCart(eachCofee),
                          icon: Icon(Icons.add),
                        );
                      })),
            ],
          ),
        ),
      ),
    ));
  }
}
