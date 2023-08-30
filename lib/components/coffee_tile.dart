import 'package:coffee_app/models/coffee.dart';
<<<<<<< HEAD
=======
import 'package:coffee_app/pages/detail_screen.dart';
>>>>>>> ec533fb0e5c69ca78905e8e43967818271667dde
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;
   CoffeeTile({super.key, required this.coffee,required this.onPressed,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
<<<<<<< HEAD
        leading: Image.asset(coffee.imagePath),
=======
        leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                title: coffee.name,
                description: coffee.description,
                id: coffee.id,
                price: coffee.price,
                image: coffee.imagePath,
              )));
            },
            child: Image.asset(coffee.imagePath)),
>>>>>>> ec533fb0e5c69ca78905e8e43967818271667dde
        trailing: IconButton(icon: icon,
        onPressed: onPressed,
      ),
    ));
  }
}
