import 'package:get/get.dart';
import 'package:student_app_getx/screens/add%20student/functions/functions.dart';

class StudentAddController extends GetxController {
  RxString imagpath = ''.obs;
  RxBool imageErrorVisible = false.obs;
  RxBool isPhotoSelected = false.obs;
  RxString groupValue = ''.obs;
  RxBool genderErrorVisible = false.obs;

  @override
  void onClose() {
    imagpath.value = '';
    imageErrorVisible.value = false;
    isPhotoSelected.value = false;
    groupValue.value = '';
    genderErrorVisible.value = false;
    nameController.clear();
    ageController.clear();
    phoneController.clear();
    super.onClose();
  }

  addimage(String imagePath) {
    imagpath.value = imagePath;
    isPhotoSelected.value = true;
  }

  showImageError() {
    imageErrorVisible.value = true;
  }

  selectGender(String value) {
    groupValue.value = value;
    genderErrorVisible.value = false;
  }

  showGenderError() {
    genderErrorVisible.value = true;
  }
}
