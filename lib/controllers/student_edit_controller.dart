import 'package:get/get.dart';


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
  addImage(String imagePath) {
    imagpath.value = imagePath;
  }

  selectGender(String value) {
    groupValue.value = value;
  }
}
