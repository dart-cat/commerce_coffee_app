import 'package:coffee_app/components/coffee_tile.dart';
import 'package:coffee_app/components/TimePicker/timepicker_screen.dart';
import 'package:coffee_app/const.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:coffee_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
//remove item from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  //pay button tapped

  void payNow() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            BlackText(text: 'Back')
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: AnimatedButton(
                        onPress: () {
                          print('Delivery Time button pressed');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TimePickerScreen()));
                        },
                        height: 50,
                        width: 300,
                        text: 'Delivery Time',
                        gradient: LinearGradient(colors: [
                          gradientbuttoncolor4,
                          gradientbuttoncolor3
                        ]),
                        selectedGradientColor: LinearGradient(colors: [
                          gradientbuttoncolor2,
                          gradientbuttoncolor1
                        ]),
                        isReverse: true,
                        borderRadius: 20,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                        borderColor: Colors.white,
                        borderWidth: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: AnimatedButton(
                          onPress: () {},
                          height: 50,
                          width: 300,
                          text: 'Payment Manager',
                          gradient: LinearGradient(colors: [
                            gradientbuttoncolor4,
                            gradientbuttoncolor3
                          ]),
                          selectedGradientColor: LinearGradient(colors: [
                            gradientbuttoncolor2,
                            gradientbuttoncolor1
                          ]),
                          isReverse: true,
                          borderRadius: 20,
                          selectedTextColor: Colors.black,
                          transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                          borderColor: Colors.white,
                          borderWidth: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    //вот сюда нужно вставить детали заказа(выбранное время и выбранный платежный метод)
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      child: const Text(
                          '                       Apple Gay                   '),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              //list of cart items
              Expanded(
                  child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index) {
                  //get individual cart items
                  Coffee eachCoffee = value.userCart[index];

                  //return the coffee tile
                  return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeFromCart(eachCoffee),
                      icon: const Icon(Icons.delete));
                },
              )),

              //pay button
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    'Pay Now',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
