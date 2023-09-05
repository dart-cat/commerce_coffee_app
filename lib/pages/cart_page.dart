import 'package:coffee_app/components/coffee_tile.dart';
import 'package:coffee_app/const.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:coffee_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

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
                      child: PrettyShadowButton(
                        bgColor: Colors.white,
                        icon: Icons.accessible_forward_outlined,
                        foregroundColor: Colors.black,
                        shadowColor: backgrdelivbutton,
                        label: '       Arrival Time at the cafe         ',
                        onPressed: () {},
                      ),
                    ),),

                     Padding(
                       padding: const EdgeInsets.only(top: 20),
                       child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child:Center(
                          child: PrettyShadowButton(
                            bgColor: Colors.white,
                            icon: Icons.accessible_forward_outlined,
                            foregroundColor: Colors.black,
                            shadowColor: backgrpaymentbutton,
                            label: '          Payment Manager            ',
                            onPressed: () {},
                          ),
                        ),
                    ),
                     ),

                  SizedBox(height: MediaQuery.of(context).size.height / 2),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      child: const Text('                       Apple Gay                   '),
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
