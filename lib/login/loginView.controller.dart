import 'package:astolphus/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  static const email = 'admin@admin.com';
  static const password = 'admin';

  void tryTologin() {
    switch (emailInput.text) {
      case email:
        checkPassword();
        break;
      case '':
        printError('Insira um email');
        break;
      default:  
        printError('Este email não está cadastrado');
    } 
  }

  void checkPassword() {
    switch (passwordInput.text) {
      case password:
        login();
        break;
      case '':
        printError('Insira uma senha');
        break;
      default:
        printError('Senha incorreta para o email cadastrado');
    }  
  }

  void login() {
    Get.to(HomeView());
  }

  void printError(String error) {
    print(error);
  }

}