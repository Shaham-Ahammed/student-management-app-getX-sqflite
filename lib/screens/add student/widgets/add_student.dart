
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_getx/screens/add%20student/functions/functions.dart';


class AddStudentButtonAndFinalValidation extends StatelessWidget {
  const AddStudentButtonAndFinalValidation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.cyan)),
        onPressed: () async {
          if (!addController.isPhotoSelected.value) {
            addController.showImageError();
          }
          if (addController.groupValue.value.isEmpty) {
            addController.showGenderError();
          }
          if (formKey.currentState!.validate() &&
              addController.isPhotoSelected.value == true &&
              addController.groupValue.value.isNotEmpty) {
            await addData();
            Get.back();
            addController.onClose();
          } else {
            return;
          }
        },
        child: Text(
          "ADD STUDENT",
          style: GoogleFonts.akayaKanadaka(),
        ));
  }
}