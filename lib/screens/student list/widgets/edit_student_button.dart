
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/student_controller.dart';
import '../../edit student/student_edit.dart';

class EditButton extends StatelessWidget {
  final int index;
  const EditButton({
    super.key,
    required this.controller,
    required this.index,
  });

  final StudentController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.to(
          transition: Transition.rightToLeft,
 duration: Duration(seconds: 1),
 
          () => StudentEdit(
           
            id: controller.studentList[index].id!,
            name: controller.studentList[index].name,
            age: controller.studentList[index].age,
            image: controller.studentList[index].images,
            gender: controller.studentList[index].gender,
            phone: controller.studentList[index].phone));
      },
      icon: const Icon(Icons.edit),
    );
  }
}
