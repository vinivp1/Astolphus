import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astolphus/signup/signupView.controller.dart';

class EmailFieldSignup extends GetView<SignupController> {
  const EmailFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller.emailInputSignup,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "E-mail",
        labelStyle: TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        ),
      )
    );
  }
}