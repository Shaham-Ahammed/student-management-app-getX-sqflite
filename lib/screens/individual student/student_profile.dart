
import 'package:flutter/material.dart';

import 'package:student_app_getx/screens/individual%20student/widget/student_details.dart';

class StudentProfile extends StatelessWidget {
  final int id;
  final String name;
  final String age;
  final String phone;
  final String gender;
  final String images;

  const StudentProfile(
      {super.key,
      required this.id,
      required this.name,
      required this.age,
      required this.phone,
      required this.gender,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image(images),
                const SizedBox(
                  height: 30,
                ),
                Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.cyan[400],
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          studentName(name),
                          studentAge(age),
                          studentGender(gender),
                          studentPhoneNumber(phone),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
