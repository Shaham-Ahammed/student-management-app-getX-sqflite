
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/screens/edit%20student/student_edit.dart';

import '../../add student/functions/functions.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Select Gender :',
            style: myStyle(16, FontWeight.bold, Colors.black),
          ),
          Row(
            children: [
              Radio(
                  activeColor: Colors.red,
                  value: 'Male',
                  groupValue: editController.groupValue.value,
                  onChanged: (value) {
                    editController.selectGender(value!);
                  }),
              Text('Male', style: myStyle(12, FontWeight.bold, Colors.black)),
              Radio(
                  activeColor: Colors.red,
                  value: 'Female',
                  groupValue: editController.groupValue.value,
                  onChanged: (value) {
                    editController.selectGender(value!);
                  }),
              Text('Female', style: myStyle(12, FontWeight.bold, Colors.black))
            ],
          ),
        ],
      );
    });
  }
}
