
  import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:student_app_getx/controllers/student_add_controller.dart';
import 'package:student_app_getx/db%20helper/db_helper.dart';
import 'package:student_app_getx/model/student_model.dart';

StudentAddController addController = Get.find();

 

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  
Future<void> addData() async {
    StudentModel stu = StudentModel(
        name: nameController.text,
        age: ageController.text,
        gender: addController.groupValue.value.toString(),
        images: addController.imagpath.value.toString(),
        phone: phoneController.text);

    await SQLHelper.createData(stu);
  }

  myStyle(double size, FontWeight weight, Color clr) {
  return TextStyle(fontSize: size, fontWeight: weight, color: clr);
}

  void getImage(ImageSource imageSource) async {
    final selectedImage = await ImagePicker().pickImage(source:imageSource);
    if (selectedImage != null) {
      addController.addimage(selectedImage.path);
    }
  }