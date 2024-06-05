import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {

  TextEditingController nameInputSignup = TextEditingController();
  TextEditingController emailInputSignup = TextEditingController();
  TextEditingController passwordInputSignup = TextEditingController();
  TextEditingController rangeInputSignup = TextEditingController();
  var notifiInputSignup = ''.obs;

  var isLoading = false.obs;

  Future<void> registerUser() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('https://flasktest-f17y.onrender.com/cadastro'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nome': nameInputSignup.text,
          'email': emailInputSignup.text,
          'senha': passwordInputSignup.text,
          'raio': rangeInputSignup.text,
          'notifica': notifiInputSignup.value,
        }),
      );

      isLoading.value = false;

      if (response.statusCode == 201) {
        print('User registered successfully');
        Get.snackbar(
          "Success",
          "User registered successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        print('Failed to register user: ${response.statusCode}');
        Get.snackbar(
          "Error",
          "Failed to register user: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print('Failed to register user: $e');
      Get.snackbar(
        "Error",
        "Failed to register user: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
