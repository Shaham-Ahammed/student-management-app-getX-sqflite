 // ignore_for_file: use_build_context_synchronously

 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db helper/db_helper.dart';

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