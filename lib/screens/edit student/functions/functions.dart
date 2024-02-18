
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_getx/db%20helper/db_helper.dart';
import 'package:student_app_getx/model/student_model.dart';

import 'package:student_app_getx/screens/edit%20student/student_edit.dart';

  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController phoneController = TextEditingController();




Future<void> updateData(int id) async {
  
    StudentModel stu = StudentModel(
        name:  nameController.text,
        age: ageController.text,
        gender: editController.groupValue.value.toString(),
        images: editController.imagpath.value.toString(),
        phone: phoneController.text);

    await SQLHelper.updateData(id, stu);
  }

  void getImage(ImageSource imageSource) async {
    final selectedImage = await ImagePicker().pickImage(source: imageSource);
    if (selectedImage != null) {
      editController.addImage(selectedImage.path);
    }
  }