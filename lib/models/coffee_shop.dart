import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
//coffee for sale list
  final List<Coffee> _shop = [
    //americano
    Coffee(
        name: 'Americanium',
        price: '5' '\$',
        imagePath: 'assets/images/americano.png',
        id: 0,
        description: 'Это простота с глубиной. Легкий и насыщенный, он предлагает гармонию между свежестью и вкусом кофе. Прекрасный выбор для тех, кто ценит глубокие ноты с легкостью наслаждения.',
    ),
    //cold coffee
    Coffee(
        name: 'Freezed Champ',
        price: '6.40' '\$',
        imagePath: 'assets/images/cold-coffee.png',
        id: 1,
        description: 'Находка для тех, кто ищет освежение. Эспрессо, пройдя через процесс охлаждения, становится идеальным спутником в жаркий день. Прохлада и энергия, соединенные в одном стакане, создают неповторимый баланс вкусовых ощущений.',
    ),
    //espresso
    Coffee(
        name: 'Espresso',
        price: '5.10' '\$',
        imagePath: 'assets/images/espresso.png',
        id: 2,
        description: 'Это сила в небольшой порции. Концентрированный вкус и аромат, собранные в одной чашке. Мгновение энергии и интенсивности, которое разбудит вас и дарит яркий старт дню.',
    ),
    //latte
    Coffee(
        name: 'Latte',
        price: '6' '\$',
        imagePath: 'assets/images/latte.png',
        id: 1,
        description: 'Выбор тех, кто ценит красоту и нежность в чашке. Сочетание эспрессо и молока в пропорции 1:3 создаёт мягкий вкус, завершаемый нежной пенкой. Дополнительное удовольствие – посыпать поверхность тёртым шоколадом и наслаждаться ароматом. И для тех, кто желает больше, бариста приготовит сироп на выбор, добавляя индивидуальный акцент.',
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
