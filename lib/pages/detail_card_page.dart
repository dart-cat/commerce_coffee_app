import 'package:coffee_app/const.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final title;
  final id;
  final description;
  final image;
  final price;
  const DetailCard({super.key, this.title, this.id, this.description, this.image, this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height /3,
              decoration: BoxDecoration(
                image: DecorationImage(
                   image: AssetImage('$image'),
                  fit: BoxFit.fill
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(description),
          ),
          Text(price),
        ],
      ),
    );
  }
}
