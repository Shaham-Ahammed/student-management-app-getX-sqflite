import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:student_app_getx/screens/add%20student/functions/functions.dart';

class GenderErrorDisplay extends StatelessWidget {
  const GenderErrorDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (addController.genderErrorVisible.value &&
          addController.groupValue.value.isEmpty) {
        return const Text(
          'Please select a gender',
          style: TextStyle(color: Colors.red),
        );
      } else {
        return Container();
      }
    });
  }
}

class ObxImageError extends StatelessWidget {
  const ObxImageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (addController.imageErrorVisible.value &&
          addController.imagpath.value.isEmpty) {
        return const Text(
          'Please add a photo',
          style: TextStyle(color: Colors.red),
        );
      } else {
        return Container();
      }
    });
  }
}