import 'package:coffee_app/components/TimePicker/am_pm.dart';
import 'package:coffee_app/components/TimePicker/hours.dart';
import 'package:coffee_app/components/TimePicker/minutes.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          elevation: 0,
        ),
        backgroundColor: Colors.grey[900],
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.01,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 12,
                    builder: (context, index) {
                      return Minutes(mins: index);
                    },
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.01,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) {
                      return Hours(hours: index);
                    },
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.01,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 2,
                    builder: (context, index) {
                      if (index == 0) {
                        return const AmPm(isAmPm: true);
                      } else {
                        return const AmPm(isAmPm: false);
                      }
                    },
                  )),
            ),
          ],
        ));
  }
}
