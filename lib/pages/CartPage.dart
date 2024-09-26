import 'package:cofeeshope/components/cofee_tile.dart';
import 'package:cofeeshope/models/cofee.dart';
import 'package:cofeeshope/models/cofee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Cofee cofee) {
    Provider.of<CofeeShop>(context, listen: false).removeItemFromCart(cofee);
  }

  void payNow() {}
  @override
  Widget build(BuildContext context) {
    return Consumer<CofeeShop>(
        builder: (context, value, child) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Your Cart",
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            // get individual value
                            Cofee eachCofee = value.userCart[index];

                            return CofeeTile(
                                cofee: eachCofee,
                                onPressed: () => removeFromCart(eachCofee),
                                icon: Icon(Icons.delete));
                          },
                        ),
                      ),
                      // pay button
                      GestureDetector(
                        onTap: payNow,
                        child: Container(
                          padding: EdgeInsets.all(25),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Pay Now",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
