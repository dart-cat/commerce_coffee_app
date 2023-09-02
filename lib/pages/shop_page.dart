import 'package:coffee_app/components/coffee_tile.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
//add coffee to cart
  void addToCart(Coffee coffee) {
    //add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // let user know it add been successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully added to cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  //heading message
                  children: [
                    const Text(
                      "What would you like your coffee?",
                      style: TextStyle(fontSize: 20),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //list of coffee to buy
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.coffeeShop.length,
                            itemBuilder: (context, index) {
                              //get individual coffee
                              Coffee eachCoffee = value.coffeeShop[index];
                              //return the tile for this coffee
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              eachCoffee: eachCoffee)));
                                },
                                child: CoffeeTile(
                                  coffee: eachCoffee,
                                  icon: const Icon(Icons.add),
                                  onPressed: () => addToCart(eachCoffee),
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ));
  }
}
