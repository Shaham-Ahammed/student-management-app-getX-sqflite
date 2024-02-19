
  import 'package:flutter/material.dart';
import 'package:student_app_getx/controllers/student_controller.dart';
import 'package:student_app_getx/screens/student%20list/functions/functions.dart';

IconButton deleteButton(
      StudentController controller, int index, BuildContext context) {
    return IconButton(
      onPressed: () {
        deleteData(controller.filteredStudentList[index].id!,
            controller.filteredStudentList[index].name, context);
      },
      icon: Icon(
        Icons.delete,
        color: Colors.red[400],
      ),
    );
  }
