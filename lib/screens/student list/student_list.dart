import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            : controller.studentList.isEmpty
                ? Center(
                    child: Text(
                    "no students added",
                    style: TextStyle(
                        fontFamily: GoogleFonts.aboreto().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ))
                : Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SearchBox(
                        controller: controller,
                      ),
                      Obx(() {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: controller.filteredStudentList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                  await Future.delayed(const Duration(milliseconds: 100));

                                Get.to(
                                    fullscreenDialog: false,
                                    curve: Curves.easeInOutQuart,
                                    duration: const Duration(seconds: 2),
                                    () => StudentProfile(
                                        id: controller
                                            .filteredStudentList[index].id!,
                                        name: controller
                                            .filteredStudentList[index].name,
                                        age: controller
                                            .filteredStudentList[index].age,
                                        images: controller
                                            .filteredStudentList[index].images,
                                        gender: controller
                                            .filteredStudentList[index].gender,
                                        phone: controller
                                            .filteredStudentList[index].phone));
                              },
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
