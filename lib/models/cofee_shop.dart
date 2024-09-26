import 'package:flutter/material.dart';
import 'cofee.dart';

class CofeeShop extends ChangeNotifier {
  // cofee for sale
  final List<Cofee> _shop = [
    // expresso
    Cofee(name: "expresso", price: "40", imagePath: "lib/images/expresso.png"),
    // capitino
    Cofee(name: "capitino", price: "30", imagePath: "lib/images/tamper.png"),

    // ice cofee
    Cofee(
        name: "ice-cofie", price: "50", imagePath: "lib/images/iced-coffee.png")
  ];
  // user cart
  List<Cofee> _userCart = [];

  // get cofee list
  List<Cofee> get cofeeShop => _shop;

  // get user cart
  List<Cofee> get userCart => _userCart;
  // add item to cart
  void addItemToCart(Cofee cofee) {
    _userCart.add(cofee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Cofee cofee) {
    _userCart.remove(cofee);
    notifyListeners();
  }
}
