// import 'package:astolphus/home/home_page.dart';
import 'package:astolphus/login/widgets/emailField.widgets.dart';
import 'package:astolphus/login/widgets/loginButton.widget.dart';
import 'package:astolphus/login/widgets/passwordField.widgets.dart';
import 'package:astolphus/login/widgets/signupButton.widgets.dart';
import 'package:astolphus/signup/signup.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginView.controller.dart';

class LoginView extends GetView<LoginController> {
  final controller = Get.put(LoginController());
  LoginView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Astolphus')),
        ),
      body: _body(),
    );
  }
}
  _body() {
    return Center(
      child:  ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: [
          SizedBox(
            height: Get.height / 2,
          ),
          EmailField(),
          SizedBox(height:12),
          Divider(),
          PasswordField(),
          SizedBox(height:12),
          Loginbutton(),
          SizedBox(height:12),
          Signupbutton(),
        ],
      ),
    );
  }