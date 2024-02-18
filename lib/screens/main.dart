import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:student_app_getx/controllers/initialization.dart';

import 'student_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitializeControllers(),
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.cyan[800],
          appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan)),
      debugShowCheckedModeBanner: false,
      home: const StudentList(),
    );
  }
}
