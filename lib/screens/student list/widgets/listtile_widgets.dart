
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../controllers/student_controller.dart';

class CardTitle extends StatelessWidget {
  final int index;
  const CardTitle({
    super.key,
    required this.index,
    required this.controller,
  });

  final StudentController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        controller.filteredStudentList[index].name,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final int index;
  const CardImage({
    super.key,
    required this.controller,
    required this.index,
  });

  final StudentController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(90)),
      child: ClipOval(
        child: Image.file(
          File(controller.filteredStudentList[index].images),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}