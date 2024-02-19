import 'dart:developer';

import 'package:get/get.dart';
import 'package:student_app_getx/db%20helper/db_helper.dart';
import 'package:student_app_getx/model/student_model.dart';

class StudentController extends GetxController {
  RxList<StudentModel> studentList = <StudentModel>[].obs;
  RxList<StudentModel> filteredStudentList = <StudentModel>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    isLoading.value = true;
    await fetchStudents();
    filteredStudentList.value = [...studentList];
    isLoading.value = false;
    super.onInit();
  }

  fetchStudents() async {
    try {
      var studentsData = await SQLHelper.getAllData();
      // print(studentsData);
      List<StudentModel> students = studentsData.map((student) {
        return StudentModel(
            id: student['id'],
            name: student['name'],
            age: student['age'],
            gender: student['gender'],
            images: student['images'],
            phone: student['phone']);
      }).toList();
      studentList.assignAll(students);
      runFilter("");
    } catch (e) {
      log("$e");
    }
  }

  runFilter(String query) {
    if (query.isEmpty) {
      filteredStudentList.value = [...studentList];
    } else {
      filteredStudentList.value = studentList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
