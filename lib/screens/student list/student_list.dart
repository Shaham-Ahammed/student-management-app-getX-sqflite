import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controllers/student_controller.dart';
import 'package:student_app_getx/screens/student%20list/widgets/add_student_button.dart';
import 'package:student_app_getx/screens/individual%20student/student_profile.dart';
import 'widgets/app_bar.dart';
import 'widgets/delete_button.dart';
import 'widgets/edit_student_button.dart';
import 'widgets/listtile_widgets.dart';
import 'widgets/search_box.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.find();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 233, 255),
      appBar: appBar(),
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
                  const SearchBox(),
                  Obx(() {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.studentList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(
                            fullscreenDialog: false,
                            curve:Curves.easeInOutQuart,
                            duration: const Duration(seconds:2),
                            () => StudentProfile(
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
                              title: CardTitle(
                                  controller: controller, index: index),
                              leading: CardImage(
                                  controller: controller, index: index),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  EditButton(
                                      controller: controller, index: index),
                                  deleteButton(controller, index, context),
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
      floatingActionButton: const StudentAddButton(),
    );
  }


 
}






