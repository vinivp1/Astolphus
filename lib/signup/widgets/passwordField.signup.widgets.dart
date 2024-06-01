import 'package:astolphus/signup/signupView.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordFieldSignup extends GetView<SignupController> {
  const PasswordFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.passwordInputSignup,
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