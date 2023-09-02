import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final ValueChanged<int> onNumOfItemsChanged;
  const Counter({super.key, required this.onNumOfItemsChanged});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinedButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
                widget.onNumOfItemsChanged(numOfItems);
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            numOfItems.toString().padRight(2, 'x'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        buildOutlinedButton(
            icon: Icons.add,
            press: () {
              setState(() {
                if (numOfItems < 9) {
                  setState(() {
                    numOfItems++;
                    widget.onNumOfItemsChanged(numOfItems);
                  });
                }
              });
            })
      ],
    );
  }

  SizedBox buildOutlinedButton({IconData? icon, Function? press}) {
    return SizedBox(
      width: 25.0,
      height: 25.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: press as void Function()?,
        child: Icon(
          icon,
          size: 15.0,
        ),
      ),
    );
  }
}
