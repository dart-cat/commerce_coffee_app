import 'package:animated_background/animated_background.dart';
import 'package:coffee_app/components/Coffee_detail/counter.dart';
import 'package:coffee_app/components/Coffee_detail/dropdown.dart';
import 'package:coffee_app/components/Coffee_detail/small_medium_large.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.eachCoffee});
  final Coffee eachCoffee;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  int numOfItems = 1;
  num? price;

  void changeNumOfItems(int newValue) {
    setState(() {
      numOfItems = newValue;
      changeNumOfPrice();
    });
  }

  void changeNumOfPrice() {
    setState(() {
      price = numOfItems * num.parse('${widget.eachCoffee.price}');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final height = size.height;
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
                spawnMaxRadius: 30,
                spawnMaxSpeed: 25,
                particleCount: 30,
                spawnMinRadius: 10,
                spawnMinSpeed: 3,
                minOpacity: 0.3,
                spawnOpacity: 0.4,
                baseColor: Color(0xFFE6CCB2))),
        vsync: this,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 1.1,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: size.height > 600 ? height * 0.3 : height * 0.4,
                      ),
                      padding: EdgeInsets.only(
                        top: size.height * 0.15,
                        left: 20.0,
                        right: 20.0,
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.eachCoffee.description),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const SizePicker(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${'Number of ${widget.eachCoffee.name}'} \'s:'),
                              Counter(onNumOfItemsChanged: changeNumOfItems),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'Customizations',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Number of sugar packs:'),
                              DropDown(),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pumps of creamer:'),
                              DropDown(),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pumps of whipped cream:'),
                              DropDown(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hot',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            widget.eachCoffee.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                          ),
                          // const SizedBox(
                          //   height: 10.0,
                          // ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(text: 'Price\n'),
                                      TextSpan(
                                        text:
                                            '${widget.eachCoffee.price}${widget.eachCoffee.currency}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.02),
                                  child: Hero(
                                    tag: '${widget.eachCoffee.id}',
                                    child: Image.asset(
                                      widget.eachCoffee.imagePath,
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<CoffeeShop>(context, listen: false)
              .addItemToCart(widget.eachCoffee);
          print('$numOfItems');
          Navigator.pop(context);
        },
        label: Text(
            'Add to cart (${price?.toStringAsFixed(2) ?? widget.eachCoffee.price}${widget.eachCoffee.currency})'),
        icon: const Icon(Icons.coffee),
        backgroundColor: Colors.brown[300],
      ),
    );
  }
}
