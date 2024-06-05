import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:astolphus/home/home.page.dart';

class LoginController extends GetxController {

  String _apiResponse = "";

  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  var isLoading = false.obs;

    Future<void> _fetchData() async {
      String apiUrl = 'https://flasktest-f17y.onrender.com/login?email=${emailInput.text}&senha=${passwordInput.text}';

      try {
        final response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
            Map<String, dynamic> responseBody = json.decode(response.body);
            _apiResponse = responseBody['status'].toString();
        } else {
            _apiResponse = "Failed to load data";
        }
      } catch (e) {
          _apiResponse = "Error: $e";
      }
    }

  Future<void> login() async {
    isLoading.value = true;
    await _fetchData();
    isLoading.value = false;

    if (_apiResponse == 'Success') {
      Get.to(() => HomePage());
    } else {
      printError('Login failed');
    }
  }

  void printError(String error) {
    Get.snackbar(
        "Error",
        error,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
