import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astolphus/signup/signupView.controller.dart';

class Signupbutton extends GetView<SignupController> {
  const Signupbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.registerUser();
      },
      child: Text('Cadastrar'),
      );
  }
}