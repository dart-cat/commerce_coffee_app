import 'package:coffee_app/components/counter.dart';
import 'package:coffee_app/components/dropdown.dart';
import 'package:coffee_app/components/small_medium_large.dart';
import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, this.title, this.id, this.description, this.image, this.price});
  final title;
  final id;
  final description;
  final image;
  final price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown[300],
        appBar:  AppBar(
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        leading: IconButton(
        onPressed: () => Navigator.pop(context),
    icon: const Icon(
    Icons.arrow_back,
    color: Colors.white,
    ),
    ),
    ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.145,
                      left: 20.0,
                      right: 20.0,
                    ),
                    decoration: const BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(description),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const SizePicker(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${'Number of ' + title} \'s:'),
                            const Counter(),
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
               title ,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Price\n'),
                        TextSpan(
                          text: '$price',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Hero(
                        tag: '$id',
                        child: Image.asset(
                            image,
                          fit: BoxFit.fill,
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.pop(context),
          print('${'Added ' + title} to cart.'),
        },
        label: Text('Add to cart ($price)'),
        icon: const Icon(Icons.coffee),
        backgroundColor: Colors.brown[300],
      ),
    );

}
}