import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController instance = Get.find();

  RxString ownerId = ''.obs;

  void setOwnerId(String id) {
    ownerId.value = id;
  }

  String getOwnerId() {
    return ownerId.value;
  }
}
