import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controllers/student_controller.dart';
import 'package:student_app_getx/screens/add%20student/student_add_page.dart';
import 'package:student_app_getx/screens/edit%20student/student_edit.dart';
import 'package:student_app_getx/screens/student_profile.dart';
import 'dart:io';
import '../db helper/db_helper.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.find();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 233, 255),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("STUDENT LIST"),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                    child: TextField(
                      // onChanged: (value) => _runfilter(value),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: "search",
                          suffixIcon: Icon(Icons.search)),
                    ),
                  ),
                  Obx(() {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.studentList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => StudentProfile(
                              id: controller.studentList[index].id!,
                              name: controller.studentList[index].name,
                              age: controller.studentList[index].age,
                              images: controller.studentList[index].images,
                              gender: controller.studentList[index].gender,
                              phone: controller.studentList[index].phone)),
                          child: Card(
                            color: Colors.cyan[100],
                            margin: const EdgeInsets.all(15),
                            child: ListTile(
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  controller.studentList[index].name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              leading: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(90)),
                                child: ClipOval(
                                  child: Image.file(
                                    File(controller.studentList[index].images),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.to(() => StudentEdit(
                                          id: controller.studentList[index].id!,
                                          name: controller
                                              .studentList[index].name,
                                          age:
                                              controller.studentList[index].age,
                                          image: controller
                                              .studentList[index].images,
                                          gender: controller
                                              .studentList[index].gender,
                                          phone: controller
                                              .studentList[index].phone));
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      deleteData(
                                          controller.studentList[index].id!,
                                          controller.studentList[index].name,
                                          context);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => StudentAdd()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //for deleting
  Future<void> deleteData(int id, String name, context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              "DELETE $name ?",
              style: const TextStyle(color: Colors.red),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("NO")),
              TextButton(
                  onPressed: () async {
                    await SQLHelper.deleteData(id);
                    Get.back();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("DATA DELTED"),
                        duration: Duration(milliseconds: 800)));
                  },
                  child: const Text(
                    "YES",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }
}
