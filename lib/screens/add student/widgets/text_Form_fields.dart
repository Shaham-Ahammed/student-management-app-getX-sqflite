
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app_getx/screens/add%20student/functions/functions.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}

class AgeField extends StatelessWidget {
  const AgeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}


class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}