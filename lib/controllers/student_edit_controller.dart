import 'package:get/get.dart';
import 'package:student_app_getx/screens/add%20student/functions/functions.dart';

class StudentEditController extends GetxController {
  RxString imagpath = ''.obs;
  RxString groupValue = ''.obs;
  RxString name = "".obs;
  RxString age = "".obs;
  RxString phone = "".obs;

  void initialValues(
      {required String imagePaths,
      required String groupValues,
     }) {
    imagpath.value = imagePaths;
    groupValue.value = groupValues;
    
  }

  @override
  void onClose() {
    // imagpath.value = '';
    // groupValue.value = '';
    //    nameController.clear();
    // ageController.clear();
    // phoneController.clear();
    super.onClose();
  }

  addImage(String imagePath) {
    imagpath.value = imagePath;
  }

  selectGender(String value) {
    groupValue.value = value;
  }
}
