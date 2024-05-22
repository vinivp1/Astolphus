import 'package:astolphus/home/home.page.dart';
import 'package:astolphus/login/user.repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user.model.dart';
import '../models/password.model.dart';


class LoginController extends GetxController {
  UserRepository repository = UserRepository();
  PasswordRepository rep = PasswordRepository();

  Future<List<User>> userList() async => await repository .getUserList();
  Future<List<Password>> passwordList() async => await rep .getPasswordList();

  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  User newUser = User();

  @override
  void onInit() {
    super.onInit();

    userList().then((users) {
      passwordList().then((passwords) {
        for (int i = 0; i < users.length; i++) {
          if (emailInput.text == users[i].email) {
            checkPassword(i, passwords);
            break;
          }
        }
      }).catchError((error) {
        printError(error.toString());
      });
    }).catchError((error) {
      printError(error.toString());
    });
  }

  void checkPassword(int i, List<Password> passwords) {
    if(passwordInput.text == passwords[i].password){
      login();
    } else {
      printError("Senha Incorreta");
    }
  }

  void login() {
    Get.to(HomeView());
  }

  void printError(String error) {
    print(error);
  }
}