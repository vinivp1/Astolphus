import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astolphus/signup/signupView.controller.dart';

class NotifiFieldSignup extends GetView<SignupController> {
  const NotifiFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        value: controller.notifiInputSignup.value.isEmpty ? null : controller.notifiInputSignup.value,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.notifiInputSignup.value = newValue;
          }
        },
        decoration: const InputDecoration(
          hintText: "Deseja receber notificações?",
          labelText: "Notificações",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        items: <String>['Y', 'N'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
