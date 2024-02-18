
  import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container studentPhoneNumber(phone) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Text(
        " PHONE NUMBER     :  $phone",
        style: GoogleFonts.oswald(),
      ),
    );
  }

  Container studentGender(gender) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Text(
        "  GENDER                  :  ${gender.toUpperCase()}",
        style: GoogleFonts.oswald(),
      ),
    );
  }

  Container studentAge(age) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Text(
        "  AGE                         :  $age",
        style: GoogleFonts.oswald(),
      ),
    );
  }

  Container studentName(name) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Text(
        "  NAME                      :  ${name.toUpperCase()}",
        style: GoogleFonts.oswald(),
      ),
    );
  }

  CircleAvatar image(images) {
    return CircleAvatar(
      backgroundImage: FileImage(File(images)),
      radius: 70,
    );
  }
