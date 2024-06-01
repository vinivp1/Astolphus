import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {

  TextEditingController nameInputSignup = TextEditingController();
  TextEditingController emailInputSignup = TextEditingController();
  TextEditingController passwordInputSignup = TextEditingController();
  TextEditingController rangeInputSignup = TextEditingController();
  TextEditingController notifiInputSignup = TextEditingController();

  Future<void> registerUser() async {
    try {
      final response = await http.post(
        Uri.parse('https:flasktest-f17y.onrender.com/cadastro'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nome': nameInputSignup.text,
          'Email': emailInputSignup.text,
          'senha': passwordInputSignup.text,
          'Raio': rangeInputSignup.text,
          'Notifica': notifiInputSignup.text,
        }),
      );

      if (response.statusCode == 201) {
        print('User registered successfully');
      } else {
        print('Failed to register user: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to register user: $e');
    }
  }
}
