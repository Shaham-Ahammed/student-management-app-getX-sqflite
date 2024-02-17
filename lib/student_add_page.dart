// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_getx/controllers/student_add_controller.dart';
import 'package:student_app_getx/model/student_model.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'db helper/db_helper.dart';
import 'package:image_picker/image_picker.dart';

class StudentAdd extends StatelessWidget {

  StudentAdd({Key? key}) : super(key: key);

  

  late ImageSource _imageSource;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  bool genderErrorVisible = false;

  StudentAddController addController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text(
          "ADD STUDENT",
          style: GoogleFonts.alatsi(),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.cyan[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    width: 5, color: Colors.cyan)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Camera',
                                      style: myStyle(
                                          18, FontWeight.bold, Colors.black),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _imageSource = ImageSource.camera;
                                          _getImage();
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          size: 35,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Gallery',
                                      style: myStyle(
                                          18, FontWeight.bold, Colors.black),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _imageSource = ImageSource.gallery;
                                          _getImage();
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                        icon: const Icon(
                                          Icons.photo_outlined,
                                          size: 35,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ));
                },
                child: Center(
                  child: Obx(() {
                    return Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.cyan),
                      child: addController.imagpath.value.isEmpty
                          ? Image.asset(
                              'assets/users.png',
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(
                                addController.imagpath.value,
                              ),
                              fit: BoxFit.cover,
                            ),
                    );
                  }),
                ),
              ),
              const Positioned(
                  right: 70,
                  top: 100,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 10, 199, 251),
                  )),
              const Positioned(
                  right: 80, top: 107, child: Icon(Icons.add_a_photo))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() {
            if (addController.imageErrorVisible.value &&
                addController.imagpath.value.isEmpty) {
              return const Text(
                'Please add a photo',
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Container();
            }
          }),
          Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        labelText: "Name"),
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validator: (value) {
                      if (value == "") {
                        return "please enter your name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        labelText: "Age"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2)
                    ],
                    controller: ageController,
                    validator: (value) {
                      if (value == "") {
                        return "please enter your age";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        labelText: "Phone Number"),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    controller: phoneController,
                    validator: (value) {
                      if (value == "") {
                        return "please enter your phone Number";
                      } else if (value!.length != 10) {
                        return "phone number not valid";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Select Gender :',
                        style: myStyle(16, FontWeight.bold, Colors.black),
                      ),
                      Obx(() {
                        return Row(
                          children: [
                            Radio(
                                activeColor: Colors.red,
                                value: 'Male',
                                groupValue: addController.groupValue.value,
                                onChanged: (value) {
                                  addController.selectGender(value!);
                                }),
                            Text('Male',
                                style:
                                    myStyle(12, FontWeight.bold, Colors.black)),
                            Radio(
                                activeColor: Colors.red,
                                value: 'Female',
                                groupValue: addController.groupValue.value,
                                onChanged: (value) {
                                  addController.selectGender(value!);
                                }),
                            Text('Female',
                                style:
                                    myStyle(12, FontWeight.bold, Colors.black))
                          ],
                        );
                      }),
                    ],
                  ),
                  Obx(() {
                    if (addController.genderErrorVisible.value &&
                        addController.groupValue.value.isEmpty) {
                      return const Text(
                        'Please select a gender',
                        style: TextStyle(color: Colors.red),
                      );
                    } else {
                      return Container();
                    }
                  })
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
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
                if (_formKey.currentState!.validate() &&
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
              ))
        ]),
      ),
    );
  }

  void _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
     addController.addimage(selectedImage.path);
    }
  }
}

myStyle(double size, FontWeight weight, Color clr) {
  return TextStyle(fontSize: size, fontWeight: weight, color: clr);
}
