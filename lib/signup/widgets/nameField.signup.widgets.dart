import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astolphus/signup/signupView.controller.dart';

class NameFieldSignup extends GetView<SignupController> {
  const NameFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller.nameInputSignup,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Nome",
        labelStyle: TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        ),
      )
    );
  }
}