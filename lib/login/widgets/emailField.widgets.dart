import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../loginView.controller.dart';

class EmailField extends GetView<LoginController> {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller.emailInput,
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