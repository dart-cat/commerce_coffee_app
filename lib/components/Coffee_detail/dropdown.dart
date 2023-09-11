import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'Zero';
  @override
  Widget build(BuildContext context) {
    return buildDropDown(context);
  }

  DropdownButton<String> buildDropDown(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward,
        color: dropdownValue != 'Zero' ? Colors.black : Colors.black54,
      ),
      iconSize: 20.0,
      elevation: 16,
      style: TextStyle(
        color: dropdownValue != 'Zero' ? Colors.black : Colors.black54,
      ),
      underline: Container(
        height: 2.0,
        color: dropdownValue != 'Zero' ? Colors.black : Colors.black54,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue ?? '';
        });
      },
      items: <String>[
        'Zero',
        'One',
        'Two(+ .25c)',
        'Three(+ .50c)',
        'Four(+ .75c)',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}