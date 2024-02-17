import 'package:get/get.dart';

class StudentAddController extends GetxController {
  RxString imagpath = ''.obs;
  RxBool imageErrorVisible = false.obs;
  RxBool isPhotoSelected = false.obs;
  addimage(String imagePath) {
    imagpath.value = imagePath;

    isPhotoSelected.value = true;
  }

  showImageError() {
    imageErrorVisible.value = true;
  }
}
