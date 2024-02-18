 import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_getx/screens/edit%20student/functions/functions.dart';



Future<dynamic> imageSourceDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.cyan[50],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(width: 5, color: Colors.cyan)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Camera',
                        style: myStyle(18, FontWeight.bold, Colors.black),
                      ),
                      IconButton(
                          onPressed: () {
                          
                            getImage(ImageSource.camera);
                            Navigator.of(context, rootNavigator: true).pop();
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
                        style: myStyle(18, FontWeight.bold, Colors.black),
                      ),
                      IconButton(
                          onPressed: ()async {
                           
                            getImage(ImageSource.gallery);
                            Navigator.of(context, rootNavigator: true).pop();
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
  }