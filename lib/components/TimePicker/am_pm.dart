import 'package:flutter/material.dart';



class AmPm extends StatelessWidget {
  final bool isAmPm;

  const AmPm({Key? key, required this.isAmPm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            isAmPm == true ? 'am' : 'pm',
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
