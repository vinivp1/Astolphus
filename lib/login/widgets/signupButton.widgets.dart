import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astolphus/signup/signup.view.dart';
import 'package:astolphus/signup/signupView.controller.dart';

class Signupbutton extends GetView<SignupController> {
  const Signupbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(SignupPage());
      },
      child: Text('Cadastrar'),
    );
  }
}