import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astolphus/signup/signupView.controller.dart';

class RangeFieldSignup extends GetView<SignupController> {
  const RangeFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller.rangeInputSignup,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "Raio de segurança",
        labelStyle: TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        ),
      )
    );
  }
}