

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/screens/edit%20student/student_edit.dart';

class ObxImageDisplay extends StatelessWidget {
  const ObxImageDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.transparent),
        child: Image.file(
          File(
            editController.imagpath.value,
          ),
          fit: BoxFit.cover,
        ),
      );
    });
  }
}