import 'package:get/get.dart';
import 'package:astolphus/login/loginView.controller.dart';

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
