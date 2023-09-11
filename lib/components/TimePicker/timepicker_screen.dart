import 'package:coffee_app/components/TimePicker/timepicker.dart';
import 'package:flutter/material.dart';

class TimePickerScreen extends StatelessWidget {
  const TimePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: const Center(
        child: TimePicker(), // Используйте ваш TimePicker здесь
      ),
    );
  }
}
