import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astolphus/signup/signupView.controller.dart';

class NotifiFieldSignup extends GetView<SignupController> {
  const NotifiFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller.notifiInputSignup,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Deseja receber notificações?",
        labelStyle: TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        ),
      )
    );
  }
}