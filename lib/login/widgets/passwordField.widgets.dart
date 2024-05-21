import 'package:astolphus/login/loginView.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordField extends GetView<LoginController> {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.passwordInput,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Senha",
        labelStyle: TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        ),
      )
    );
  }
}