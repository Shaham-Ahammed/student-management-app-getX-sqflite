
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:student_app_getx/screens/add%20student/functions/functions.dart';

class RadioButtons extends StatelessWidget {
  const RadioButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Select Gender :',
          style: myStyle(16, FontWeight.bold, Colors.black),
        ),
        Obx(() {
          return Row(
            children: [
              Radio(
                  activeColor: Colors.red,
                  value: 'Male',
                  groupValue: addController.groupValue.value,
                  onChanged: (value) {
                    addController.selectGender(value!);
                  }),
              Text('Male',
                  style:
                      myStyle(12, FontWeight.bold, Colors.black)),
              Radio(
                  activeColor: Colors.red,
                  value: 'Female',
                  groupValue: addController.groupValue.value,
                  onChanged: (value) {
                    addController.selectGender(value!);
                  }),
              Text('Female',
                  style:
                      myStyle(12, FontWeight.bold, Colors.black))
            ],
          );
        }),
      ],
    );
  }
}
