
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
           
            id: controller.filteredStudentList[index].id!,
            name: controller.filteredStudentList[index].name,
            age: controller.filteredStudentList[index].age,
            image: controller.filteredStudentList[index].images,
            gender: controller.filteredStudentList[index].gender,
            phone: controller.filteredStudentList[index].phone));
      },
      icon: const Icon(Icons.edit),
    );
  }
}
