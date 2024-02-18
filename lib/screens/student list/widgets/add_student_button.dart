
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/screens/add%20student/student_add_page.dart';

class StudentAddButton extends StatelessWidget {
  const StudentAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
  Get.to(
    curve: Curves.easeInOutQuart,
    transition: Transition.size,
    duration:Duration(milliseconds: 1300),
    ()=> const StudentAdd());

  
      },
      child: const Icon(Icons.add),
    );
  }
}