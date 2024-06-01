import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../loginView.controller.dart';

class Loginbutton extends GetView<LoginController> {
  const Loginbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.isLoading.value ? null : controller.login;
      },
      child: controller.isLoading.value ? const CircularProgressIndicator() : Text('Entrar'),
      );
  }
}