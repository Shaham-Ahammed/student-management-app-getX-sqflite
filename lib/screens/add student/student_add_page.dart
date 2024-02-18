// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:student_app_getx/screens/add%20student/functions/functions.dart';
import 'package:student_app_getx/screens/add%20student/widgets/add_student.dart';
import 'package:student_app_getx/screens/add%20student/widgets/appBar.dart';
import 'package:student_app_getx/screens/add%20student/widgets/error_displays.dart';
import 'package:student_app_getx/screens/add%20student/widgets/image_selection_alert.dart';
import 'package:student_app_getx/screens/add%20student/widgets/radio_buttons.dart';
import 'package:student_app_getx/screens/add%20student/widgets/text_form_fields.dart';

class StudentAdd extends StatelessWidget {
  const StudentAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    addController.initialize();
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const ImageContainer(),
          const SizedBox(
            height: 15,
          ),
          const ObxImageError(),
          Form(
            key: formKey,
            child: const SizedBox(
              width: double.infinity,
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NameField(),
                  AgeField(),
                  PhoneNumberField(),
                  RadioButtons(),
                  GenderErrorDisplay()
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const AddStudentButtonAndFinalValidation()
        ]),
      ),
    );
  }
}
