import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
//coffee for sale list
  final List<Coffee> _shop = [
    //americano
    Coffee(
        name: 'Americanium',
        price: '5',
        imagePath: 'assets/images/americano.png',
        id: 0,
        description: 'adadadad',
    ),
    //cold coffee
    Coffee(
        name: 'Freezed Champ',
        price: '6.40',
        imagePath: 'assets/images/cold-coffee.png',
        id: 1,
        description: 'dadadadad',
    ),
    //espresso
    Coffee(
        name: 'Espresso',
        price: '5.10',
        imagePath: 'assets/images/espresso.png',
        id: 2,
        description: 'dadadadad',
    ),
    //latte
    Coffee(
        name: 'Latte',
        price: '6',
        imagePath: 'assets/images/latte.png',
        id: 1,
        description: 'dadadadad',
    ),
  ];

//user cart
  final List<Coffee> _userCart = [];

//get coffee list
  List<Coffee> get coffeeShop => _shop;

//get user cart
  List<Coffee> get userCart => _userCart;

//add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

//remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
