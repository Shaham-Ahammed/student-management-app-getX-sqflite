import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
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

class AgeTextFormField extends StatelessWidget {
  const AgeTextFormField({
    super.key,
    required this.ageController,
  });

  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
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

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
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
