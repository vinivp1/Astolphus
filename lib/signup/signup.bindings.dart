import 'package:astolphus/signup/signupView.controller.dart';
import 'package:get/get.dart';

class SignupBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}